.class public LSelect;
.super Ljava/lang/Object;
.source "Select.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static foo([I)V
    .registers 6

    .prologue
    const/4 v0, 0x0

    :goto_1
    array-length v1, p0

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_1

    add-int/lit8 v1, v0, 0x1

    move v2, v0

    :goto_2
    array-length v3, p0

    if-ge v1, v3, :cond_2

    aget v3, p0, v2

    aget v4, p0, v1

    if-le v3, v4, :cond_3

    move v2, v1

    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_2
    if-eq v2, v0, :cond_4

    aget v1, p0, v2

    aget v3, p0, v0

    aput v3, p0, v2

    aput v1, p0, v0

    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 4
    array-length v0, p0

    .line 5
    new-array v2, v0, [I

    move v0, v1

    .line 6
    :goto_5
    array-length v3, p0

    if-ge v0, v3, :cond_13

    .line 7
    aget-object v3, p0, v0

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    aput v3, v2, v0

    .line 6
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 9
    :cond_13
    invoke-static {v2}, LSelect;->foo([I)V

    .line 10
    :goto_16
    array-length v0, v2

    if-ge v1, v0, :cond_23

    .line 11
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    aget v3, v2, v1

    invoke-virtual {v0, v3}, Ljava/io/PrintStream;->println(I)V

    .line 10
    add-int/lit8 v1, v1, 0x1

    goto :goto_16

    .line 12
    :cond_23
    return-void
.end method
