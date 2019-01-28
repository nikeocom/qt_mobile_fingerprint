package YOUR_PACKAGE_NAME;

import android.hardware.fingerprint.FingerprintManager;
import android.os.CancellationSignal;

import org.qtproject.qt5.android.QtNative;
import android.content.Intent;
import android.util.Log;
import android.app.Activity;

import static android.content.Context.FINGERPRINT_SERVICE;
/**
 * Small helper class to manage text/icon around fingerprint authentication UI.
 */
public class Fingerprint extends FingerprintManager.AuthenticationCallback {
    private final FingerprintManager mFingerprintManager;
    private CancellationSignal mCancellationSignal;

    public native void error();
    public native void authenticated();
    public native void help();

    /**
     * Constructor for {@link FingerprintHelper}.
     */
    Fingerprint() {
        Activity activity = org.qtproject.qt5.android.QtNative.activity();
        mFingerprintManager = (FingerprintManager) activity.getSystemService(FINGERPRINT_SERVICE);
    }

    public boolean isFingerprintAuthAvailable() {
        // The line below prevents the false positive inspection from Android Studio
        // noinspection ResourceType
        return mFingerprintManager.isHardwareDetected() && mFingerprintManager.hasEnrolledFingerprints();
    }

    public void startListening() {
        if (!isFingerprintAuthAvailable()) {
            return;
        }
        mCancellationSignal = new CancellationSignal();
        mFingerprintManager.authenticate(
        null,
        mCancellationSignal, 0 /* flags */, this, null);
    }

    public void stopListening() {
        mCancellationSignal.cancel();
        mCancellationSignal = null;
    }

    @Override
    public void onAuthenticationError(int errMsgId, CharSequence errString) {
        if (errMsgId != 5 && errMsgId != 7) {
            error();
        }
        if (errMsgId == 7) {
            help();
        }
    }

    @Override
    public void onAuthenticationHelp(int helpMsgId, CharSequence helpString) {
         help();
    }

    @Override
    public void onAuthenticationFailed() {
         error();
    }

    @Override
    public void onAuthenticationSucceeded(FingerprintManager.AuthenticationResult result) {
         authenticated();
    }
}
