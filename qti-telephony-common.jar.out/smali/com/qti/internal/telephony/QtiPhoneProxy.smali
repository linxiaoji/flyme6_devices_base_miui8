.class public Lcom/qti/internal/telephony/QtiPhoneProxy;
.super Lcom/android/internal/telephony/PhoneProxy;
.source "QtiPhoneProxy.java"


# static fields
.field private static NOT_READY:I

.field private static READY:I


# instance fields
.field private LOG_TAG:Ljava/lang/String;

.field private mIsPhoneReadySent:Z

.field private mQtiRilInterface:Lcom/qti/internal/telephony/QtiRilInterface;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 50
    const/4 v0, 0x1

    sput v0, Lcom/qti/internal/telephony/QtiPhoneProxy;->READY:I

    .line 51
    const/4 v0, 0x0

    sput v0, Lcom/qti/internal/telephony/QtiPhoneProxy;->NOT_READY:I

    return-void
.end method

.method public constructor <init>(Lcom/android/internal/telephony/PhoneBase;)V
    .locals 2
    .param p1, "phone"    # Lcom/android/internal/telephony/PhoneBase;

    .prologue
    .line 56
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/PhoneProxy;-><init>(Lcom/android/internal/telephony/PhoneBase;)V

    .line 47
    const-string v0, "QtiPhoneProxy"

    iput-object v0, p0, Lcom/qti/internal/telephony/QtiPhoneProxy;->LOG_TAG:Ljava/lang/String;

    .line 49
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/qti/internal/telephony/QtiPhoneProxy;->mIsPhoneReadySent:Z

    .line 58
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/qti/internal/telephony/QtiPhoneProxy;->LOG_TAG:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/android/internal/telephony/PhoneBase;->getPhoneId()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/qti/internal/telephony/QtiPhoneProxy;->LOG_TAG:Ljava/lang/String;

    .line 59
    invoke-virtual {p1}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/qti/internal/telephony/QtiRilInterface;->getInstance(Landroid/content/Context;)Lcom/qti/internal/telephony/QtiRilInterface;

    move-result-object v0

    iput-object v0, p0, Lcom/qti/internal/telephony/QtiPhoneProxy;->mQtiRilInterface:Lcom/qti/internal/telephony/QtiRilInterface;

    .line 60
    return-void
.end method

.method private updatePhoneReady(I)V
    .locals 3
    .param p1, "phoneId"    # I

    .prologue
    const/4 v2, 0x1

    .line 96
    iget-boolean v0, p0, Lcom/qti/internal/telephony/QtiPhoneProxy;->mIsPhoneReadySent:Z

    if-nez v0, :cond_0

    const-string v0, "persist.radio.poweron_opt"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    if-ne v0, v2, :cond_0

    .line 98
    const-string v0, "Sending Phone Ready to RIL."

    invoke-virtual {p0, v0}, Lcom/qti/internal/telephony/QtiPhoneProxy;->logd(Ljava/lang/String;)V

    .line 99
    iget-object v0, p0, Lcom/qti/internal/telephony/QtiPhoneProxy;->mQtiRilInterface:Lcom/qti/internal/telephony/QtiRilInterface;

    sget v1, Lcom/qti/internal/telephony/QtiPhoneProxy;->READY:I

    invoke-virtual {v0, v1, p1}, Lcom/qti/internal/telephony/QtiRilInterface;->sendPhoneStatus(II)V

    .line 100
    iput-boolean v2, p0, Lcom/qti/internal/telephony/QtiPhoneProxy;->mIsPhoneReadySent:Z

    .line 102
    :cond_0
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 6
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v5, 0x0

    .line 64
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 65
    .local v0, "ar":Landroid/os/AsyncResult;
    iget v3, p1, Landroid/os/Message;->what:I

    packed-switch v3, :pswitch_data_0

    .line 91
    :goto_0
    :pswitch_0
    invoke-super {p0, p1}, Lcom/android/internal/telephony/PhoneProxy;->handleMessage(Landroid/os/Message;)V

    .line 93
    :goto_1
    return-void

    .line 68
    :pswitch_1
    iget v3, p1, Landroid/os/Message;->what:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    const-string v2, "EVENT_VOICE_RADIO_TECH_CHANGED"

    .line 70
    .local v2, "what":Ljava/lang/String;
    :goto_2
    iget-object v3, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v3, :cond_2

    .line 71
    iget-object v3, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    if-eqz v3, :cond_1

    iget-object v3, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v3, [I

    check-cast v3, [I

    array-length v3, v3

    if-eqz v3, :cond_1

    .line 72
    iget-object v3, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v3, [I

    check-cast v3, [I

    aget v1, v3, v5

    .line 73
    .local v1, "newVoiceTech":I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": newVoiceTech="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/qti/internal/telephony/QtiPhoneProxy;->logd(Ljava/lang/String;)V

    .line 74
    invoke-virtual {p0, v1}, Lcom/qti/internal/telephony/QtiPhoneProxy;->phoneObjectUpdater(I)V

    .line 75
    iget v3, p0, Lcom/qti/internal/telephony/QtiPhoneProxy;->mPhoneId:I

    invoke-direct {p0, v3}, Lcom/qti/internal/telephony/QtiPhoneProxy;->updatePhoneReady(I)V

    goto :goto_1

    .line 68
    .end local v1    # "newVoiceTech":I
    .end local v2    # "what":Ljava/lang/String;
    :cond_0
    const-string v2, "EVENT_REQUEST_VOICE_RADIO_TECH_DONE"

    goto :goto_2

    .line 77
    .restart local v2    # "what":Ljava/lang/String;
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": has no tech!"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/qti/internal/telephony/QtiPhoneProxy;->loge(Ljava/lang/String;)V

    goto :goto_1

    .line 80
    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": exception="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/qti/internal/telephony/QtiPhoneProxy;->loge(Ljava/lang/String;)V

    goto :goto_1

    .line 84
    .end local v2    # "what":Ljava/lang/String;
    :pswitch_2
    iput-boolean v5, p0, Lcom/qti/internal/telephony/QtiPhoneProxy;->mIsPhoneReadySent:Z

    .line 85
    iget v3, p0, Lcom/qti/internal/telephony/QtiPhoneProxy;->mPhoneId:I

    invoke-direct {p0, v3}, Lcom/qti/internal/telephony/QtiPhoneProxy;->updatePhoneReady(I)V

    goto/16 :goto_1

    .line 89
    :pswitch_3
    iput-boolean v5, p0, Lcom/qti/internal/telephony/QtiPhoneProxy;->mIsPhoneReadySent:Z

    goto/16 :goto_0

    .line 65
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method protected logd(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 106
    iget-object v0, p0, Lcom/qti/internal/telephony/QtiPhoneProxy;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[QtiPhoneProxy] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    return-void
.end method

.method protected loge(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 111
    iget-object v0, p0, Lcom/qti/internal/telephony/QtiPhoneProxy;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[QtiPhoneProxy] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 112
    return-void
.end method
