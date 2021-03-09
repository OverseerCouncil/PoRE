.class public LCheckBox;
.super Ljava/lang/Object;
.source "CheckBox.java"


# instance fields
.field checker:LChecker;

.field encoder:LEncoder;

.field private rawInfo:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, LEncoder;

    invoke-direct {v0}, LEncoder;-><init>()V

    iput-object v0, p0, LCheckBox;->encoder:LEncoder;

    new-instance v0, LChecker;

    invoke-direct {v0}, LChecker;-><init>()V

    iput-object v0, p0, LCheckBox;->checker:LChecker;

    return-void
.end method

.method private checkInput()Z
    .registers 3

    .prologue
    iget-object v0, p0, LCheckBox;->checker:LChecker;

    iget-object v1, p0, LCheckBox;->rawInfo:Ljava/lang/String;

    invoke-virtual {v0, v1}, LChecker;->check(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static main([Ljava/lang/String;)V
    .registers 5

    .prologue
    new-instance v0, LCheckBox;

    invoke-direct {v0}, LCheckBox;-><init>()V

    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "input: "

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    new-instance v1, Ljava/util/Scanner;

    sget-object v2, Ljava/lang/System;->in:Ljava/io/InputStream;

    invoke-direct {v1, v2}, Ljava/util/Scanner;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v1}, Ljava/util/Scanner;->nextLine()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, LCheckBox;->rawInfo:Ljava/lang/String;

    const-string v2, ""

    array-length v3, p0

    if-nez v3, :cond_47

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v3, 0xb

    if-ne v1, v3, :cond_47

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "Task 2: (Encoded msg) "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, LCheckBox;->getEncP()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_41
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    return-void

    :cond_47
    array-length v1, p0

    const/4 v3, 0x1

    if-ne v1, v3, :cond_6a

    const/4 v1, 0x0

    aget-object v1, p0, v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "Task 2: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0, v1}, LCheckBox;->checkEncP(Ljava/lang/String;)Z

    move-result v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_41

    :cond_6a
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "Task 1: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-direct {v0}, LCheckBox;->checkInput()Z

    move-result v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_41
.end method


# virtual methods
.method public checkEncP(Ljava/lang/String;)Z
    .registers 4

    .prologue
    iget-object v0, p0, LCheckBox;->encoder:LEncoder;

    iget-object v1, p0, LCheckBox;->rawInfo:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, LEncoder;->check(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public getEncP()Ljava/lang/String;
    .registers 3

    .prologue
    iget-object v0, p0, LCheckBox;->encoder:LEncoder;

    iget-object v1, p0, LCheckBox;->rawInfo:Ljava/lang/String;

    invoke-virtual {v0, v1}, LEncoder;->encoding(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
