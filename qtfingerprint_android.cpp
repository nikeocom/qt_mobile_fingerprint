#include "qtfingerprint.h"

#include <QAndroidJniObject>
#include <QAndroidJniEnvironment>

//static int error_count = 0;
//static void error(JNIEnv  *env, jobject obj)
//{
//    Q_UNUSED(env)
//    Q_UNUSED(obj)
//    if (error_count == 3) {
//        error_count = 0;
//        // TODO not available
//    } else {
//        ++error_count;
//    }
//}

//static void authenticated(JNIEnv  *env, jobject obj)
//{
//    Q_UNUSED(env)
//    Q_UNUSED(obj)
//    error_count = 0;
//    // TODO authorized
//}
//static void help(JNIEnv  *env, jobject obj)
//{
//    Q_UNUSED(env)
//    Q_UNUSED(obj)
//}

//JNINativeMethod methods[] = {
//    {"error", "()V", reinterpret_cast<void*>(error)},
//    {"authenticated", "()V", reinterpret_cast<void*>(authenticated)},
//    {"help", "()V", reinterpret_cast<void*>(help)}
//};
