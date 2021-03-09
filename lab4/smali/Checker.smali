.class public LChecker;
.super Ljava/lang/Object;
.source "Checker.java"


# instance fields
.field private secret:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "key"

    iput-object v0, p0, LChecker;->secret:Ljava/lang/String;

    return-void
.end method

.method private checkStr1(Ljava/lang/String;)Z
    .registers 12

    .prologue
    const/4 v9, 0x2

    const/4 v5, 0x1

    const/4 v1, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v6

    move v0, v1

    move v2, v1

    move v3, v1

    move v4, v1

    :goto_b
    array-length v7, v6

    if-ge v0, v7, :cond_1f

    aget-char v7, v6, v0

    const/16 v8, 0x78

    if-ne v7, v8, :cond_1c

    add-int/lit8 v2, v2, 0x1

    if-ne v2, v5, :cond_19

    move v4, v0

    :cond_19
    if-ne v2, v9, :cond_1c

    move v3, v0

    :cond_1c
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    :cond_1f
    if-ne v2, v9, :cond_26

    sub-int v0, v3, v4

    const/4 v2, 0x4

    if-eq v0, v2, :cond_27

    :cond_26
    :goto_26
    return v1

    :cond_27
    aget-char v0, v6, v1

    const/16 v2, 0x30

    if-ne v0, v2, :cond_26

    array-length v0, v6

    add-int/lit8 v0, v0, -0x1

    aget-char v0, v6, v0

    const/16 v2, 0x39

    if-ne v0, v2, :cond_26

    invoke-virtual {p1, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, LChecker;->secret:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_26

    move v1, v5

    goto :goto_26
.end method

.method private count(Ljava/lang/String;)I
    .registers 7

    .prologue
    const/4 v1, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v3

    move v0, v1

    move v2, v1

    :goto_7
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_19

    aget-char v1, v3, v0

    const/16 v4, 0x31

    if-ne v1, v4, :cond_1a

    add-int/lit8 v1, v2, 0x1

    :goto_15
    add-int/lit8 v0, v0, 0x1

    move v2, v1

    goto :goto_7

    :cond_19
    return v2

    :cond_1a
    move v1, v2

    goto :goto_15
.end method

.method private func(I)I
    .registers 3

    .prologue
    const/4 v0, 0x1

    if-gt p1, v0, :cond_4

    :goto_3
    return v0

    :cond_4
    add-int/lit8 v0, p1, -0x1

    invoke-direct {p0, v0}, LChecker;->func(I)I

    move-result v0

    mul-int/2addr v0, p1

    goto :goto_3
.end method


# virtual methods
.method public check(Ljava/lang/String;)Z
    .registers 6

    .prologue
    const/16 v3, 0xa

    const/4 v0, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0xc

    if-lt v1, v2, :cond_13

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x10

    if-le v1, v2, :cond_14

    :cond_13
    :goto_13
    return v0

    :cond_14
    invoke-virtual {p1, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, LChecker;->count(Ljava/lang/String;)I

    move-result v2

    invoke-direct {p0, v2}, LChecker;->func(I)I

    move-result v3

    if-ne v3, v2, :cond_13

    invoke-direct {p0, v1}, LChecker;->checkStr1(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_13

    const/4 v0, 0x1

    goto :goto_13
.end method
