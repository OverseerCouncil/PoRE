.class public LEncoder;
.super Ljava/lang/Object;
.source "Encoder.java"


# instance fields
.field private algorithm:Ljava/lang/String;

.field private charSet:Ljava/lang/String;

.field private final hexDigits:[Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 4

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x10

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "0"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "1"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "2"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "3"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "4"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "5"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "6"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "7"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "8"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "9"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "a"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "b"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "c"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "d"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "e"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "f"

    aput-object v2, v0, v1

    iput-object v0, p0, LEncoder;->hexDigits:[Ljava/lang/String;

    const-string v0, "MD5"

    iput-object v0, p0, LEncoder;->algorithm:Ljava/lang/String;

    const-string v0, "utf-8"

    iput-object v0, p0, LEncoder;->charSet:Ljava/lang/String;

    return-void
.end method

.method private byteArrayToHexString([B)Ljava/lang/String;
    .registers 5

    .prologue
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const/4 v0, 0x0

    :goto_6
    array-length v2, p1

    if-ge v0, v2, :cond_15

    aget-byte v2, p1, v0

    invoke-direct {p0, v2}, LEncoder;->byteToHexString(B)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    :cond_15
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private byteToHexString(B)Ljava/lang/String;
    .registers 6

    .prologue
    if-gez p1, :cond_4

    and-int/lit16 p1, p1, 0xff

    :cond_4
    div-int/lit8 v0, p1, 0x10

    rem-int/lit8 v1, p1, 0x10

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, LEncoder;->hexDigits:[Ljava/lang/String;

    aget-object v0, v3, v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, LEncoder;->hexDigits:[Ljava/lang/String;

    aget-object v1, v2, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getSalt()Ljava/lang/String;
    .registers 6

    .prologue
    const/16 v4, 0x10

    new-instance v1, Ljava/util/Random;

    invoke-direct {v1}, Ljava/util/Random;-><init>()V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    const/4 v0, 0x0

    :goto_d
    if-ge v0, v4, :cond_23

    invoke-virtual {v1}, Ljava/util/Random;->nextBoolean()Z

    move-result v3

    if-eqz v3, :cond_1d

    const-string v3, "1"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_1a
    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    :cond_1d
    const-string v3, "0"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1a

    :cond_23
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public check(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 10

    .prologue
    const/16 v6, 0x30

    const/4 v0, 0x0

    const/16 v1, 0x20

    new-array v2, v1, [C

    const/16 v1, 0x10

    new-array v3, v1, [C

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    if-eq v1, v6, :cond_12

    :goto_11
    return v0

    :cond_12
    move v1, v0

    :goto_13
    if-ge v1, v6, :cond_3a

    div-int/lit8 v4, v1, 0x3

    mul-int/lit8 v4, v4, 0x2

    invoke-virtual {p2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    aput-char v5, v2, v4

    div-int/lit8 v4, v1, 0x3

    mul-int/lit8 v4, v4, 0x2

    add-int/lit8 v4, v4, 0x1

    add-int/lit8 v5, v1, 0x2

    invoke-virtual {p2, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    aput-char v5, v2, v4

    div-int/lit8 v4, v1, 0x3

    add-int/lit8 v5, v1, 0x1

    invoke-virtual {p2, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    aput-char v5, v3, v4

    add-int/lit8 v1, v1, 0x3

    goto :goto_13

    :cond_3a
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v3}, Ljava/lang/String;-><init>([C)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v3, ""

    :try_start_52
    iget-object v4, p0, LEncoder;->algorithm:Ljava/lang/String;

    invoke-static {v4}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v5, p0, LEncoder;->charSet:Ljava/lang/String;

    invoke-virtual {v1, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v1

    invoke-direct {p0, v1}, LEncoder;->byteArrayToHexString([B)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v2}, Ljava/lang/String;-><init>([C)V

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_7f
    .catch Ljava/lang/Exception; {:try_start_52 .. :try_end_7f} :catch_81

    move-result v0

    goto :goto_11

    :catch_81
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_11
.end method

.method public encoding(Ljava/lang/String;)Ljava/lang/String;
    .registers 9

    .prologue
    const/16 v6, 0x30

    const-string v0, ""

    invoke-direct {p0}, LEncoder;->getSalt()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :try_start_19
    iget-object v3, p0, LEncoder;->algorithm:Ljava/lang/String;

    invoke-static {v3}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, LEncoder;->charSet:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v2

    invoke-direct {p0, v2}, LEncoder;->byteArrayToHexString([B)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_3d
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_3d} :catch_70

    move-result-object v2

    const/16 v0, 0x30

    :try_start_40
    new-array v3, v0, [C

    const/4 v0, 0x0

    :goto_43
    if-ge v0, v6, :cond_6a

    div-int/lit8 v4, v0, 0x3

    mul-int/lit8 v4, v4, 0x2

    invoke-virtual {v2, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    aput-char v4, v3, v0

    div-int/lit8 v4, v0, 0x3

    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    add-int/lit8 v5, v0, 0x1

    aput-char v4, v3, v5

    add-int/lit8 v4, v0, 0x2

    div-int/lit8 v5, v0, 0x3

    mul-int/lit8 v5, v5, 0x2

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v2, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    aput-char v5, v3, v4

    add-int/lit8 v0, v0, 0x3

    goto :goto_43

    :cond_6a
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v3}, Ljava/lang/String;-><init>([C)V
    :try_end_6f
    .catch Ljava/lang/Exception; {:try_start_40 .. :try_end_6f} :catch_75

    :goto_6f
    return-object v0

    :catch_70
    move-exception v1

    :goto_71
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_6f

    :catch_75
    move-exception v1

    move-object v0, v2

    goto :goto_71
.end method