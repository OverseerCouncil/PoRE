.class public LGetIP;
.super Ljava/lang/Object;
.source "GetIP.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static foo(Ljava/lang/String;)Ljava/lang/StringBuffer;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
     new-instance v0, Ljava/lang/StringBuffer;

     invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

     invoke-static {p0}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

     move-result-object v1

     invoke-virtual {v1}, Ljava/net/InetAddress;->getHostName()Ljava/lang/String;

     move-result-object v2

     invoke-virtual {v1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

     move-result-object v3

     invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

     move-result-object v4

     const-string v1, "="

     invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

     move-result-object v2

     invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

     return-object v0
.end method

.method public static main([Ljava/lang/String;)V
    .registers 3

    .prologue
    .line 6
    const/4 v0, 0x0

    .line 8
    const/4 v1, 0x0

    :try_start_2
    aget-object v1, p0, v1

    invoke-static {v1}, LGetIP;->foo(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_7
    .catch Ljava/net/UnknownHostException; {:try_start_2 .. :try_end_7} :catch_e

    move-result-object v0

    .line 12
    :goto_8
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    .line 13
    return-void

    .line 9
    :catch_e
    move-exception v1

    .line 10
    invoke-virtual {v1}, Ljava/net/UnknownHostException;->printStackTrace()V

    goto :goto_8
.end method
