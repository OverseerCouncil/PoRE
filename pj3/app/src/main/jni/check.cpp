#include <jni.h>
#include "com_example_henjiandan_MainActivity.h"

#include <stdio.h>
#include <string.h>
#include <malloc.h>
#include <assert.h>
#include <pthread.h>
#include <unistd.h>

#define JNIREG_CLASS "com/example/henjiandan/MainActivity"

int tb = 0;
int tc = 0;
void a();
void b();
void c();
char *e(char *code);
void *thread(void *vargp);

static char* jstringToChar(JNIEnv* env, jstring jstr) {
    char* rtn = NULL;
    jclass clsstring = env -> FindClass("java/lang/String");
    jstring strencode = env -> NewStringUTF("GB2312");
    jmethodID mid = env -> GetMethodID(clsstring, "getBytes", "(Ljava/lang/String;)[B");
    jbyteArray barr = (jbyteArray) env -> CallObjectMethod(jstr, mid, strencode);
    jsize alen = env -> GetArrayLength(barr);
    jbyte* ba = env -> GetByteArrayElements(barr, JNI_FALSE);
    if (alen >= 0) {
        rtn = (char*) malloc(alen + 1);
        memcpy(rtn, ba, alen);
        rtn[alen] = '\0';
    }
    env -> ReleaseByteArrayElements(barr, ba, 0);
    return rtn;
}

// 检查{}里的24位
JNIEXPORT jint JNICALL jNI_OnLoad(JNIEnv * env, jobject ja, jstring jb) {
    if (tb || tc)
        return 0;

    char *s = jstringToChar(env, jb);
    char *seeme = (char *)malloc(24 * sizeof(char));
    seeme = e("YmF2c2doamtkaTAxMjM0NTY3ODlBQkM=");
    char result[24];
    char *resultanswer = (char *)malloc(25 * sizeof(char));
    resultanswer = e("Z3ZhamJnYmh2Z2JhZ3ZiYmhnZ3NhZ2Ji");

    // 这个数组是用来迷惑的
    jint pl111ll[4] = {0, 0, 0, 0};

    jint psycho[24];

    for (jint i = 0; i < 24; i++) {
        psycho[i] = 0;
    }

    jintArray retarr=env -> NewIntArray(24);
    env -> SetIntArrayRegion(retarr, 0, 23, psycho);

    // 这也也用来迷惑
    jint pll1l1l[4];
    jint k = 0;
    for (jint index = 0; index < 4; index++) {
        for (jint j = 6 * index; j < 6 * index + 5; j++) {
            pll1l1l[k] += (s[j] - '0');
        }
        // 这个是骗人的其实最后都变成了0
        pll1l1l[k] = pl111ll[k]%5;
        k++;
    }

    // 对p1,p2,trick，s进行操作,更改前12位
    for (jint x = 0; x < 2; x++) {
        for(jint y = x * 6; y < x * 6 + 6; y++) {
            // 可以更复杂
            result[y] = seeme[(s[y] % 18 + pll1l1l[0] - pll1l1l[1]) & (s[y] / 18)];
        }
    }

    //更新心理数组
    for (jint i = 0; i < 12; i++) {
        if (resultanswer[i] == result[i]) {
            psycho[i + 12] = 1;
        }
    }

    //对p3,p4,s进行操作
    for (jint x = 2; x < 4; x++) {
        for(jint y = x * 6; y < x * 6 + 6; y++) {
            //可以更复杂
            result[y] = seeme[(s[y] % 17 + pll1l1l[2] - pll1l1l[3]) & (s[y] / 17)];
        }
    }

    //更新心理数组
    for (jint i = 12; i < 24; i++) {
        if (resultanswer[i] == result[i]) {
            psycho[i - 12] = 1;
        }
    }

    jint c = 0, m = 0;
    for (jint z = 0; z < 24; z++) {
        if (psycho[z] == 1) c++;
    }

    if (c <= 5) return 0;

    //有部分错，toast：全错，没一位对的
    while (m < 24) {
        //cout<<"全错，没一位对的"<<"\n";
        if (psycho[m] == 0) return 1;
        m++;
    }

    //全对，toast：right！！！
    return 2;

}

//方法对应表
static JNINativeMethod gMethods[] = {
    {e("Y2hlY2s="), e("KExqYXZhL2xhbmcvU3RyaW5nOylJ)"), (void*)jNI_OnLoad},
};

// 为一个类注册本地方法
static int registerNativeMethods(JNIEnv* env, const char* className, JNINativeMethod* gMethods, int numMethods) {
    jclass clazz;
    clazz = env -> FindClass(className);
    if (clazz == NULL) {
        return JNI_FALSE;
    }
    if (env->RegisterNatives(clazz, gMethods, numMethods) < 0) {
        return JNI_FALSE;
    }
    return JNI_TRUE;
}

// 为所有类注册本地方法
static int registerNatives(JNIEnv* env) {
    return registerNativeMethods(env, JNIREG_CLASS, gMethods, sizeof(gMethods) / sizeof(gMethods[0]));
}

JNIEXPORT jint JNICALL JNI_OnLoad(JavaVM* vm, void* reserved) {
    JNIEnv* env = NULL;
    jint result = -1;
    if (vm->GetEnv((void**) &env, JNI_VERSION_1_4) != JNI_OK) {
        return -1;
    }
    assert(env != NULL);
    if (!registerNatives(env)) {
        return -1;
    }
    pthread_t tid;
    pthread_create(&tid, NULL, thread, NULL);
    if (tb || tc)
        return -1;
    //成功
    result = JNI_VERSION_1_4;
    return result;
}

JNIEXPORT jint JNICALL jnI_OnLoad(JNIEnv * env, jobject ja, jstring jb) {
    char *answer = "V1pOQntZb3VfaGF2ZV9nb3RfdGhlX3JlYWxfZmxhZ30=";
        char *passwd = jstringToChar(env, jb);
        int move = 10;
        for(int i = 0; i < strlen(passwd); i++) {
            if(passwd[i] >= 'A' && passwd[i] <= 'Z') {
                passwd[i] = ((passwd[i]-'A')+move)%26+'A';
            }
            else if(passwd[i] >= 'a' && passwd[i] <= 'z') {
                passwd[i] = ((passwd[i]-'a')+move)%26+'a';
            }
        }
        jint result = 1;
        for (int i = 0; i < strlen(passwd) && i < strlen(answer); i++) {
            if (passwd[i] != answer[i])
                result = 0;
        }
        return result;
}

JNIEXPORT jint JNICALL jni_OnLoad(JNIEnv * env, jobject ja, jstring jb) {
    char *answer = "V1pOQntZb3VfaGF2ZV9nb3RfdGhlX3JlYWxfZmxhZ30=";
        char *passwd = jstringToChar(env, jb);
        int move = 10;
        for(int i = 0; i < strlen(passwd); i++) {
            if(passwd[i] >= 'A' && passwd[i] <= 'Z') {
                passwd[i] = ((passwd[i]-'A')+move)%26+'A';
            }
            else if(passwd[i] >= 'a' && passwd[i] <= 'z') {
                passwd[i] = ((passwd[i]-'a')+move)%26+'a';
            }
        }
        jint result = 1;
        for (int i = 0; i < strlen(passwd) && i < strlen(answer); i++) {
            if (passwd[i] != answer[i])
                result = 0;
        }
        return result;
}

JNIEXPORT jint JNICALL jni_onLoad(JNIEnv * env, jobject ja, jstring jb) {
    char *answer = "V1pOQntZb3VfaGF2ZV9nb3RfdGhlX3JlYWxfZmxhZ30=";
        char *passwd = jstringToChar(env, jb);
        int move = 10;
        for(int i = 0; i < strlen(passwd); i++) {
            if(passwd[i] >= 'A' && passwd[i] <= 'Z') {
                passwd[i] = ((passwd[i]-'A')+move)%26+'A';
            }
            else if(passwd[i] >= 'a' && passwd[i] <= 'z') {
                passwd[i] = ((passwd[i]-'a')+move)%26+'a';
            }
        }
        jint result = 1;
        for (int i = 0; i < strlen(passwd) && i < strlen(answer); i++) {
            if (passwd[i] != answer[i])
                result = 0;
        }
        return result;
}

JNIEXPORT jint JNICALL jni_onload(JNIEnv * env, jobject ja, jstring jb) {
    char *answer = "V1pOQntZb3VfaGF2ZV9nb3RfdGhlX3JlYWxfZmxhZ30=";
        char *passwd = jstringToChar(env, jb);
        int move = 10;
        for(int i = 0; i < strlen(passwd); i++) {
            if(passwd[i] >= 'A' && passwd[i] <= 'Z') {
                passwd[i] = ((passwd[i]-'A')+move)%26+'A';
            }
            else if(passwd[i] >= 'a' && passwd[i] <= 'z') {
                passwd[i] = ((passwd[i]-'a')+move)%26+'a';
            }
        }
        jint result = 1;
        for (int i = 0; i < strlen(passwd) && i < strlen(answer); i++) {
            if (passwd[i] != answer[i])
                result = 0;
        }
        return result;
}

JNIEXPORT jint JNICALL Java_com_example_henjiandan_MainActivity_check(JNIEnv * env, jobject ja, jstring jb) {
    char *answer = "V1pOQntZb3VfaGF2ZV9nb3RfdGhlX3JlYWxfZmxhZ30=";
    char *passwd = jstringToChar(env, jb);
    int move = 10;
    for(int i = 0; i < strlen(passwd); i++) {
        if(passwd[i] >= 'A' && passwd[i] <= 'Z') {
            passwd[i] = ((passwd[i]-'A')+move)%26+'A';
        }
        else if(passwd[i] >= 'a' && passwd[i] <= 'z') {
            passwd[i] = ((passwd[i]-'a')+move)%26+'a';
        }
    }
    jint result = 1;
    for (int i = 0; i < strlen(passwd) && i < strlen(answer); i++) {
        if (passwd[i] != answer[i])
            result = 0;
    }
    return result;
}

// Check whether tracer exists
void a() {
    const int bufsize = 1024;
    char filename[bufsize];
    char line[bufsize];
    int pid = getpid();
    sprintf(filename, "/proc/%d/status", pid);
    FILE* fd = fopen(filename, "r");
    if (fd != nullptr) {
        while (fgets(line, bufsize, fd)) {
            if (strncmp(line, "TracerPid", 9) == 0) {
                int statue = atoi(&line[10]);
                if (statue != 0) {
                    fclose(fd);
                    kill(pid, SIGKILL);
                }
                break;
            }
        fclose(fd);
        }
    }
    else
        printf("open %s fail...", filename);
}

// Check port
void b() {
    FILE* pfile=NULL;
    char* strNetstat = "netstat |grep :23946"; pfile = popen(strNetstat, "r");
    if (pfile == NULL)
        return;
    else {
        tb = 0;
        pclose(pfile);
    }
}

// Check processes
void c() {
    FILE* pfile = NULL;
    char buf[0x1000] = {0};
    pfile = popen("ps","r");
    if (pfile == NULL) return;

    while (fgets(buf, sizeof(buf), pfile)) {
        char *strA=NULL, *strB=NULL, *strC=NULL, *strD=NULL;
        strA = strstr(buf, "android_server");
        strB = strstr(buf, "gdbserver");
        strC = strstr(buf, "gdb");
        strD = strstr(buf, "fuwu");
        if (strA || strB ||strC || strD)
            tc = 0;
    }
    pclose(pfile);
}

void *thread(void *vargp) {
    pthread_detach(pthread_self());
    while (1) {
        a();
        b();
        c();
        sleep(3);
    }
    return NULL;
}

char *e(char *code)
{
    int table[]={0,0,0,0,0,0,0,0,0,0,0,0,
    		 0,0,0,0,0,0,0,0,0,0,0,0,
    		 0,0,0,0,0,0,0,0,0,0,0,0,
    		 0,0,0,0,0,0,0,62,0,0,0,
    		 63,52,53,54,55,56,57,58,
    		 59,60,61,0,0,0,0,0,0,0,0,
    		 1,2,3,4,5,6,7,8,9,10,11,12,
    		 13,14,15,16,17,18,19,20,21,
    		 22,23,24,25,0,0,0,0,0,0,26,
    		 27,28,29,30,31,32,33,34,35,
    		 36,37,38,39,40,41,42,43,44,
    		 45,46,47,48,49,50,51
    	       };
    long len;
    long str_len;
    char *res;
    int i,j;

    len=strlen(code);
    if(strstr(code,"=="))
        str_len=len/4*3-2;
    else if(strstr(code,"="))
        str_len=len/4*3-1;
    else
        str_len=len/4*3;

    res = (char *)malloc(str_len * sizeof(char) + 1);
    res[str_len]='\0';

    for(i=0,j=0;i < len-2;j+=3,i+=4)
    {
        res[j]=((char)table[code[i]])<<2 | (((char)table[code[i+1]])>>4);
        res[j+1]=(((char)table[code[i+1]])<<4) | (((char)table[code[i+2]])>>2);
        res[j+2]=(((char)table[code[i+2]])<<6) | ((char)table[code[i+3]]);
    }

    return res;
}