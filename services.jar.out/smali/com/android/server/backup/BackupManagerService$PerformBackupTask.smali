.class Lcom/android/server/backup/BackupManagerService$PerformBackupTask;
.super Ljava/lang/Object;
.source "BackupManagerService.java"

# interfaces
.implements Lcom/android/server/backup/BackupManagerService$BackupRestoreTask;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/backup/BackupManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PerformBackupTask"
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "PerformBackupTask"


# instance fields
.field mAgentBinder:Landroid/app/IBackupAgent;

.field mBackupData:Landroid/os/ParcelFileDescriptor;

.field mBackupDataName:Ljava/io/File;

.field mCurrentPackage:Landroid/content/pm/PackageInfo;

.field mCurrentState:Lcom/android/server/backup/BackupManagerService$BackupState;

.field mFinished:Z

.field mJournal:Ljava/io/File;

.field mNewState:Landroid/os/ParcelFileDescriptor;

.field mNewStateName:Ljava/io/File;

.field mOriginalQueue:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/backup/BackupManagerService$BackupRequest;",
            ">;"
        }
    .end annotation
.end field

.field mQueue:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/backup/BackupManagerService$BackupRequest;",
            ">;"
        }
    .end annotation
.end field

.field mSavedState:Landroid/os/ParcelFileDescriptor;

.field mSavedStateName:Ljava/io/File;

.field mStateDir:Ljava/io/File;

.field mStatus:I

.field mTransport:Lcom/android/internal/backup/IBackupTransport;

.field final synthetic this$0:Lcom/android/server/backup/BackupManagerService;


# direct methods
.method public constructor <init>(Lcom/android/server/backup/BackupManagerService;Lcom/android/internal/backup/IBackupTransport;Ljava/lang/String;Ljava/util/ArrayList;Ljava/io/File;)V
    .locals 2
    .param p2, "transport"    # Lcom/android/internal/backup/IBackupTransport;
    .param p3, "dirName"    # Ljava/lang/String;
    .param p5, "journal"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/internal/backup/IBackupTransport;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/backup/BackupManagerService$BackupRequest;",
            ">;",
            "Ljava/io/File;",
            ")V"
        }
    .end annotation

    .prologue
    .line 2503
    .local p4, "queue":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/backup/BackupManagerService$BackupRequest;>;"
    iput-object p1, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2504
    iput-object p2, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    .line 2505
    iput-object p4, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mOriginalQueue:Ljava/util/ArrayList;

    .line 2506
    iput-object p5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mJournal:Ljava/io/File;

    .line 2508
    new-instance v0, Ljava/io/File;

    iget-object v1, p1, Lcom/android/server/backup/BackupManagerService;->mBaseStateDir:Ljava/io/File;

    invoke-direct {v0, v1, p3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStateDir:Ljava/io/File;

    .line 2510
    sget-object v0, Lcom/android/server/backup/BackupManagerService$BackupState;->INITIAL:Lcom/android/server/backup/BackupManagerService$BackupState;

    iput-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mCurrentState:Lcom/android/server/backup/BackupManagerService$BackupState;

    .line 2511
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mFinished:Z

    .line 2513
    const-string v0, "STATE => INITIAL"

    invoke-virtual {p1, v0}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2514
    return-void
.end method

.method private SHA1Checksum([B)Ljava/lang/String;
    .locals 7
    .param p1, "input"    # [B

    .prologue
    .line 2905
    :try_start_0
    const-string v5, "SHA-1"

    invoke-static {v5}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v3

    .line 2906
    .local v3, "md":Ljava/security/MessageDigest;
    invoke-virtual {v3, p1}, Ljava/security/MessageDigest;->digest([B)[B
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 2912
    .local v0, "checksum":[B
    new-instance v4, Ljava/lang/StringBuffer;

    array-length v5, v0

    mul-int/lit8 v5, v5, 0x2

    invoke-direct {v4, v5}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 2913
    .local v4, "sb":Ljava/lang/StringBuffer;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v5, v0

    if-ge v2, v5, :cond_0

    .line 2914
    aget-byte v5, v0, v2

    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 2913
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2907
    .end local v0    # "checksum":[B
    .end local v2    # "i":I
    .end local v3    # "md":Ljava/security/MessageDigest;
    .end local v4    # "sb":Ljava/lang/StringBuffer;
    :catch_0
    move-exception v1

    .line 2908
    .local v1, "e":Ljava/security/NoSuchAlgorithmException;
    const-string v5, "PerformBackupTask"

    const-string v6, "Unable to use SHA-1!"

    invoke-static {v5, v6}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2909
    const-string v5, "00"

    .line 2916
    .end local v1    # "e":Ljava/security/NoSuchAlgorithmException;
    :goto_1
    return-object v5

    .restart local v0    # "checksum":[B
    .restart local v2    # "i":I
    .restart local v3    # "md":Ljava/security/MessageDigest;
    .restart local v4    # "sb":Ljava/lang/StringBuffer;
    :cond_0
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_1
.end method

.method private writeWidgetPayloadIfAppropriate(Ljava/io/FileDescriptor;Ljava/lang/String;)V
    .locals 16
    .param p1, "fd"    # Ljava/io/FileDescriptor;
    .param p2, "pkgName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2921
    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-static {v0, v12}, Lcom/android/server/AppWidgetBackupBridge;->getWidgetState(Ljava/lang/String;I)[B

    move-result-object v10

    .line 2924
    .local v10, "widgetState":[B
    new-instance v9, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStateDir:Ljava/io/File;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p2

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "_widget"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v9, v12, v13}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 2925
    .local v9, "widgetFile":Ljava/io/File;
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v7

    .line 2934
    .local v7, "priorStateExists":Z
    if-nez v7, :cond_1

    if-nez v10, :cond_1

    .line 2977
    :cond_0
    :goto_0
    return-void

    .line 2943
    :cond_1
    const/4 v4, 0x0

    .line 2944
    .local v4, "newChecksum":Ljava/lang/String;
    if-eqz v10, :cond_4

    .line 2945
    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->SHA1Checksum([B)Ljava/lang/String;

    move-result-object v4

    .line 2946
    if-eqz v7, :cond_4

    .line 2949
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, v9}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 2948
    .local v1, "fin":Ljava/io/FileInputStream;
    const/4 v14, 0x0

    .line 2950
    :try_start_0
    new-instance v3, Ljava/io/DataInputStream;

    invoke-direct {v3, v1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 2948
    .local v3, "in":Ljava/io/DataInputStream;
    const/4 v13, 0x0

    .line 2952
    :try_start_1
    invoke-virtual {v3}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    move-result-object v6

    .line 2953
    .local v6, "priorChecksum":Ljava/lang/String;
    if-eqz v3, :cond_2

    if-eqz v13, :cond_8

    :try_start_2
    invoke-virtual {v3}, Ljava/io/DataInputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :cond_2
    :goto_1
    if-eqz v1, :cond_3

    if-eqz v14, :cond_b

    :try_start_3
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_4

    .line 2954
    :cond_3
    :goto_2
    invoke-static {v4, v6}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_0

    .line 2961
    .end local v1    # "fin":Ljava/io/FileInputStream;
    .end local v3    # "in":Ljava/io/DataInputStream;
    .end local v6    # "priorChecksum":Ljava/lang/String;
    :cond_4
    new-instance v5, Landroid/app/backup/BackupDataOutput;

    move-object/from16 v0, p1

    invoke-direct {v5, v0}, Landroid/app/backup/BackupDataOutput;-><init>(Ljava/io/FileDescriptor;)V

    .line 2962
    .local v5, "out":Landroid/app/backup/BackupDataOutput;
    if-eqz v10, :cond_13

    .line 2964
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v9}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 2963
    .local v2, "fout":Ljava/io/FileOutputStream;
    const/4 v14, 0x0

    .line 2965
    :try_start_4
    new-instance v8, Ljava/io/DataOutputStream;

    invoke-direct {v8, v2}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_7
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    .line 2963
    .local v8, "stateOut":Ljava/io/DataOutputStream;
    const/4 v13, 0x0

    .line 2967
    :try_start_5
    invoke-virtual {v8, v4}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_8
    .catchall {:try_start_5 .. :try_end_5} :catchall_5

    .line 2968
    if-eqz v8, :cond_5

    if-eqz v13, :cond_e

    :try_start_6
    invoke-virtual {v8}, Ljava/io/DataOutputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    :cond_5
    :goto_3
    if-eqz v2, :cond_6

    if-eqz v14, :cond_11

    :try_start_7
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_a

    .line 2970
    :cond_6
    :goto_4
    const-string v12, "\uffed\uffedwidget"

    array-length v13, v10

    invoke-virtual {v5, v12, v13}, Landroid/app/backup/BackupDataOutput;->writeEntityHeader(Ljava/lang/String;I)I

    .line 2971
    array-length v12, v10

    invoke-virtual {v5, v10, v12}, Landroid/app/backup/BackupDataOutput;->writeEntityData([BI)I

    goto :goto_0

    .line 2953
    .end local v2    # "fout":Ljava/io/FileOutputStream;
    .end local v5    # "out":Landroid/app/backup/BackupDataOutput;
    .end local v8    # "stateOut":Ljava/io/DataOutputStream;
    .restart local v1    # "fin":Ljava/io/FileInputStream;
    .restart local v3    # "in":Ljava/io/DataInputStream;
    .restart local v6    # "priorChecksum":Ljava/lang/String;
    :catch_0
    move-exception v11

    .local v11, "x2":Ljava/lang/Throwable;
    :try_start_8
    invoke-virtual {v13, v11}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_8
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_8} :catch_1
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    goto :goto_1

    .line 2948
    .end local v3    # "in":Ljava/io/DataInputStream;
    .end local v6    # "priorChecksum":Ljava/lang/String;
    .end local v11    # "x2":Ljava/lang/Throwable;
    :catch_1
    move-exception v12

    :try_start_9
    throw v12
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 2953
    :catchall_0
    move-exception v13

    move-object v15, v13

    move-object v13, v12

    move-object v12, v15

    :goto_5
    if-eqz v1, :cond_7

    if-eqz v13, :cond_c

    :try_start_a
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_a
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_a} :catch_5

    :cond_7
    :goto_6
    throw v12

    .restart local v3    # "in":Ljava/io/DataInputStream;
    .restart local v6    # "priorChecksum":Ljava/lang/String;
    :cond_8
    :try_start_b
    invoke-virtual {v3}, Ljava/io/DataInputStream;->close()V
    :try_end_b
    .catch Ljava/lang/Throwable; {:try_start_b .. :try_end_b} :catch_1
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    goto :goto_1

    .end local v3    # "in":Ljava/io/DataInputStream;
    .end local v6    # "priorChecksum":Ljava/lang/String;
    :catchall_1
    move-exception v12

    move-object v13, v14

    goto :goto_5

    .line 2948
    .restart local v3    # "in":Ljava/io/DataInputStream;
    :catch_2
    move-exception v13

    :try_start_c
    throw v13
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    .line 2953
    :catchall_2
    move-exception v12

    if-eqz v3, :cond_9

    if-eqz v13, :cond_a

    :try_start_d
    invoke-virtual {v3}, Ljava/io/DataInputStream;->close()V
    :try_end_d
    .catch Ljava/lang/Throwable; {:try_start_d .. :try_end_d} :catch_3
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    :cond_9
    :goto_7
    :try_start_e
    throw v12

    :catch_3
    move-exception v11

    .restart local v11    # "x2":Ljava/lang/Throwable;
    invoke-virtual {v13, v11}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_7

    .end local v11    # "x2":Ljava/lang/Throwable;
    :cond_a
    invoke-virtual {v3}, Ljava/io/DataInputStream;->close()V
    :try_end_e
    .catch Ljava/lang/Throwable; {:try_start_e .. :try_end_e} :catch_1
    .catchall {:try_start_e .. :try_end_e} :catchall_1

    goto :goto_7

    .restart local v6    # "priorChecksum":Ljava/lang/String;
    :catch_4
    move-exception v11

    .restart local v11    # "x2":Ljava/lang/Throwable;
    invoke-virtual {v14, v11}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_2

    .end local v11    # "x2":Ljava/lang/Throwable;
    :cond_b
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    goto :goto_2

    .end local v3    # "in":Ljava/io/DataInputStream;
    .end local v6    # "priorChecksum":Ljava/lang/String;
    :catch_5
    move-exception v11

    .restart local v11    # "x2":Ljava/lang/Throwable;
    invoke-virtual {v13, v11}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_6

    .end local v11    # "x2":Ljava/lang/Throwable;
    :cond_c
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    goto :goto_6

    .line 2968
    .end local v1    # "fin":Ljava/io/FileInputStream;
    .restart local v2    # "fout":Ljava/io/FileOutputStream;
    .restart local v5    # "out":Landroid/app/backup/BackupDataOutput;
    .restart local v8    # "stateOut":Ljava/io/DataOutputStream;
    :catch_6
    move-exception v11

    .restart local v11    # "x2":Ljava/lang/Throwable;
    :try_start_f
    invoke-virtual {v13, v11}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_f
    .catch Ljava/lang/Throwable; {:try_start_f .. :try_end_f} :catch_7
    .catchall {:try_start_f .. :try_end_f} :catchall_4

    goto :goto_3

    .line 2963
    .end local v8    # "stateOut":Ljava/io/DataOutputStream;
    .end local v11    # "x2":Ljava/lang/Throwable;
    :catch_7
    move-exception v12

    :try_start_10
    throw v12
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_3

    .line 2968
    :catchall_3
    move-exception v13

    move-object v15, v13

    move-object v13, v12

    move-object v12, v15

    :goto_8
    if-eqz v2, :cond_d

    if-eqz v13, :cond_12

    :try_start_11
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_11
    .catch Ljava/lang/Throwable; {:try_start_11 .. :try_end_11} :catch_b

    :cond_d
    :goto_9
    throw v12

    .restart local v8    # "stateOut":Ljava/io/DataOutputStream;
    :cond_e
    :try_start_12
    invoke-virtual {v8}, Ljava/io/DataOutputStream;->close()V
    :try_end_12
    .catch Ljava/lang/Throwable; {:try_start_12 .. :try_end_12} :catch_7
    .catchall {:try_start_12 .. :try_end_12} :catchall_4

    goto :goto_3

    .end local v8    # "stateOut":Ljava/io/DataOutputStream;
    :catchall_4
    move-exception v12

    move-object v13, v14

    goto :goto_8

    .line 2963
    .restart local v8    # "stateOut":Ljava/io/DataOutputStream;
    :catch_8
    move-exception v13

    :try_start_13
    throw v13
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_5

    .line 2968
    :catchall_5
    move-exception v12

    if-eqz v8, :cond_f

    if-eqz v13, :cond_10

    :try_start_14
    invoke-virtual {v8}, Ljava/io/DataOutputStream;->close()V
    :try_end_14
    .catch Ljava/lang/Throwable; {:try_start_14 .. :try_end_14} :catch_9
    .catchall {:try_start_14 .. :try_end_14} :catchall_4

    :cond_f
    :goto_a
    :try_start_15
    throw v12

    :catch_9
    move-exception v11

    .restart local v11    # "x2":Ljava/lang/Throwable;
    invoke-virtual {v13, v11}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_a

    .end local v11    # "x2":Ljava/lang/Throwable;
    :cond_10
    invoke-virtual {v8}, Ljava/io/DataOutputStream;->close()V
    :try_end_15
    .catch Ljava/lang/Throwable; {:try_start_15 .. :try_end_15} :catch_7
    .catchall {:try_start_15 .. :try_end_15} :catchall_4

    goto :goto_a

    :catch_a
    move-exception v11

    .restart local v11    # "x2":Ljava/lang/Throwable;
    invoke-virtual {v14, v11}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_4

    .end local v11    # "x2":Ljava/lang/Throwable;
    :cond_11
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    goto/16 :goto_4

    .end local v8    # "stateOut":Ljava/io/DataOutputStream;
    :catch_b
    move-exception v11

    .restart local v11    # "x2":Ljava/lang/Throwable;
    invoke-virtual {v13, v11}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_9

    .end local v11    # "x2":Ljava/lang/Throwable;
    :cond_12
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    goto :goto_9

    .line 2974
    .end local v2    # "fout":Ljava/io/FileOutputStream;
    :cond_13
    const-string v12, "\uffed\uffedwidget"

    const/4 v13, -0x1

    invoke-virtual {v5, v12, v13}, Landroid/app/backup/BackupDataOutput;->writeEntityHeader(Ljava/lang/String;I)I

    .line 2975
    invoke-virtual {v9}, Ljava/io/File;->delete()Z

    goto/16 :goto_0
.end method


# virtual methods
.method agentErrorCleanup()V
    .locals 1

    .prologue
    .line 3161
    iget-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mBackupDataName:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 3162
    iget-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mNewStateName:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 3163
    invoke-virtual {p0}, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->clearAgentState()V

    .line 3165
    iget-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mQueue:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/server/backup/BackupManagerService$BackupState;->FINAL:Lcom/android/server/backup/BackupManagerService$BackupState;

    :goto_0
    invoke-virtual {p0, v0}, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->executeNextState(Lcom/android/server/backup/BackupManagerService$BackupState;)V

    .line 3166
    return-void

    .line 3165
    :cond_0
    sget-object v0, Lcom/android/server/backup/BackupManagerService$BackupState;->RUNNING_QUEUE:Lcom/android/server/backup/BackupManagerService$BackupState;

    goto :goto_0
.end method

.method beginBackup()V
    .locals 12

    .prologue
    const/4 v10, 0x0

    .line 2543
    iget-object v8, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    invoke-virtual {v8}, Lcom/android/server/backup/BackupManagerService;->clearBackupTrace()V

    .line 2544
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v8, 0x100

    invoke-direct {v0, v8}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 2545
    .local v0, "b":Ljava/lang/StringBuilder;
    const-string v8, "beginBackup: ["

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2546
    iget-object v8, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mOriginalQueue:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/server/backup/BackupManagerService$BackupRequest;

    .line 2547
    .local v6, "req":Lcom/android/server/backup/BackupManagerService$BackupRequest;
    const/16 v8, 0x20

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 2548
    iget-object v8, v6, Lcom/android/server/backup/BackupManagerService$BackupRequest;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 2550
    .end local v6    # "req":Lcom/android/server/backup/BackupManagerService$BackupRequest;
    :cond_0
    const-string v8, " ]"

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2551
    iget-object v8, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2554
    const/4 v8, 0x0

    iput-object v8, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mAgentBinder:Landroid/app/IBackupAgent;

    .line 2555
    iput v10, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    .line 2558
    iget-object v8, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mOriginalQueue:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_2

    .line 2559
    const-string v8, "PerformBackupTask"

    const-string v9, "Backup begun with an empty queue - nothing to do."

    invoke-static {v8, v9}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 2560
    iget-object v8, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    const-string v9, "queue empty at begin"

    invoke-virtual {v8, v9}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2561
    sget-object v8, Lcom/android/server/backup/BackupManagerService$BackupState;->FINAL:Lcom/android/server/backup/BackupManagerService$BackupState;

    invoke-virtual {p0, v8}, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->executeNextState(Lcom/android/server/backup/BackupManagerService$BackupState;)V

    .line 2647
    :cond_1
    :goto_1
    return-void

    .line 2568
    :cond_2
    iget-object v8, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mOriginalQueue:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/ArrayList;

    iput-object v8, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mQueue:Ljava/util/ArrayList;

    .line 2574
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    iget-object v8, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mQueue:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-ge v2, v8, :cond_3

    .line 2575
    const-string v9, "@pm@"

    iget-object v8, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mQueue:Ljava/util/ArrayList;

    invoke-virtual {v8, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/android/server/backup/BackupManagerService$BackupRequest;

    iget-object v8, v8, Lcom/android/server/backup/BackupManagerService$BackupRequest;->packageName:Ljava/lang/String;

    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_7

    .line 2579
    iget-object v8, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mQueue:Ljava/util/ArrayList;

    invoke-virtual {v8, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 2584
    :cond_3
    const-string v8, "PerformBackupTask"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Beginning backup of "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mQueue:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " targets"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2586
    new-instance v5, Ljava/io/File;

    iget-object v8, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStateDir:Ljava/io/File;

    const-string v9, "@pm@"

    invoke-direct {v5, v8, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 2588
    .local v5, "pmState":Ljava/io/File;
    :try_start_0
    iget-object v8, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    invoke-interface {v8}, Lcom/android/internal/backup/IBackupTransport;->transportDirName()Ljava/lang/String;

    move-result-object v7

    .line 2589
    .local v7, "transportName":Ljava/lang/String;
    const/16 v8, 0xb05

    invoke-static {v8, v7}, Landroid/util/EventLog;->writeEvent(ILjava/lang/String;)I

    .line 2592
    iget v8, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    if-nez v8, :cond_4

    invoke-virtual {v5}, Ljava/io/File;->length()J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-gtz v8, :cond_4

    .line 2593
    const-string v8, "PerformBackupTask"

    const-string v9, "Initializing (wiping) backup state and transport storage"

    invoke-static {v8, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2594
    iget-object v8, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "initializing transport "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2595
    iget-object v8, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v9, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStateDir:Ljava/io/File;

    invoke-virtual {v8, v9}, Lcom/android/server/backup/BackupManagerService;->resetBackupState(Ljava/io/File;)V

    .line 2596
    iget-object v8, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    invoke-interface {v8}, Lcom/android/internal/backup/IBackupTransport;->initializeDevice()I

    move-result v8

    iput v8, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    .line 2598
    iget-object v8, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "transport.initializeDevice() == "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2599
    iget v8, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    if-nez v8, :cond_8

    .line 2600
    const/16 v8, 0xb0b

    const/4 v9, 0x0

    new-array v9, v9, [Ljava/lang/Object;

    invoke-static {v8, v9}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I

    .line 2612
    :cond_4
    :goto_3
    iget v8, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    if-nez v8, :cond_5

    .line 2613
    new-instance v4, Lcom/android/server/backup/PackageManagerBackupAgent;

    iget-object v8, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    # getter for: Lcom/android/server/backup/BackupManagerService;->mPackageManager:Landroid/content/pm/PackageManager;
    invoke-static {v8}, Lcom/android/server/backup/BackupManagerService;->access$400(Lcom/android/server/backup/BackupManagerService;)Landroid/content/pm/PackageManager;

    move-result-object v8

    invoke-direct {v4, v8}, Lcom/android/server/backup/PackageManagerBackupAgent;-><init>(Landroid/content/pm/PackageManager;)V

    .line 2615
    .local v4, "pmAgent":Lcom/android/server/backup/PackageManagerBackupAgent;
    const-string v8, "@pm@"

    invoke-virtual {v4}, Lcom/android/server/backup/PackageManagerBackupAgent;->onBind()Landroid/os/IBinder;

    move-result-object v9

    invoke-static {v9}, Landroid/app/IBackupAgent$Stub;->asInterface(Landroid/os/IBinder;)Landroid/app/IBackupAgent;

    move-result-object v9

    iget-object v10, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    invoke-virtual {p0, v8, v9, v10}, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->invokeAgentForBackup(Ljava/lang/String;Landroid/app/IBackupAgent;Lcom/android/internal/backup/IBackupTransport;)I

    move-result v8

    iput v8, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    .line 2617
    iget-object v8, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "PMBA invoke: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2622
    iget-object v8, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v8, v8, Lcom/android/server/backup/BackupManagerService;->mBackupHandler:Lcom/android/server/backup/BackupManagerService$BackupHandler;

    const/4 v9, 0x7

    invoke-virtual {v8, v9}, Lcom/android/server/backup/BackupManagerService$BackupHandler;->removeMessages(I)V

    .line 2625
    .end local v4    # "pmAgent":Lcom/android/server/backup/PackageManagerBackupAgent;
    :cond_5
    iget v8, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    const/16 v9, -0x3e9

    if-ne v8, v9, :cond_6

    .line 2629
    const/16 v8, 0xb0a

    iget-object v9, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    invoke-interface {v9}, Lcom/android/internal/backup/IBackupTransport;->transportDirName()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/EventLog;->writeEvent(ILjava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2639
    :cond_6
    iget-object v8, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "exiting prelim: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2640
    iget v8, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    if-eqz v8, :cond_1

    .line 2643
    iget-object v8, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v9, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStateDir:Ljava/io/File;

    invoke-virtual {v8, v9}, Lcom/android/server/backup/BackupManagerService;->resetBackupState(Ljava/io/File;)V

    .line 2644
    sget-object v8, Lcom/android/server/backup/BackupManagerService$BackupState;->FINAL:Lcom/android/server/backup/BackupManagerService$BackupState;

    invoke-virtual {p0, v8}, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->executeNextState(Lcom/android/server/backup/BackupManagerService$BackupState;)V

    goto/16 :goto_1

    .line 2574
    .end local v5    # "pmState":Ljava/io/File;
    .end local v7    # "transportName":Ljava/lang/String;
    :cond_7
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_2

    .line 2602
    .restart local v5    # "pmState":Ljava/io/File;
    .restart local v7    # "transportName":Ljava/lang/String;
    :cond_8
    const/16 v8, 0xb06

    :try_start_1
    const-string v9, "(initialize)"

    invoke-static {v8, v9}, Landroid/util/EventLog;->writeEvent(ILjava/lang/String;)I

    .line 2603
    const-string v8, "PerformBackupTask"

    const-string v9, "Transport error in initializeDevice()"

    invoke-static {v8, v9}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_3

    .line 2631
    .end local v7    # "transportName":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 2632
    .local v1, "e":Ljava/lang/Exception;
    :try_start_2
    const-string v8, "PerformBackupTask"

    const-string v9, "Error in backup thread"

    invoke-static {v8, v9, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 2633
    iget-object v8, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Exception in backup thread: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2634
    const/16 v8, -0x3e8

    iput v8, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 2639
    iget-object v8, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "exiting prelim: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2640
    iget v8, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    if-eqz v8, :cond_1

    .line 2643
    iget-object v8, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v9, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStateDir:Ljava/io/File;

    invoke-virtual {v8, v9}, Lcom/android/server/backup/BackupManagerService;->resetBackupState(Ljava/io/File;)V

    .line 2644
    sget-object v8, Lcom/android/server/backup/BackupManagerService$BackupState;->FINAL:Lcom/android/server/backup/BackupManagerService$BackupState;

    invoke-virtual {p0, v8}, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->executeNextState(Lcom/android/server/backup/BackupManagerService$BackupState;)V

    goto/16 :goto_1

    .line 2639
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v8

    iget-object v9, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "exiting prelim: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget v11, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2640
    iget v9, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    if-eqz v9, :cond_9

    .line 2643
    iget-object v9, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v10, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStateDir:Ljava/io/File;

    invoke-virtual {v9, v10}, Lcom/android/server/backup/BackupManagerService;->resetBackupState(Ljava/io/File;)V

    .line 2644
    sget-object v9, Lcom/android/server/backup/BackupManagerService$BackupState;->FINAL:Lcom/android/server/backup/BackupManagerService$BackupState;

    invoke-virtual {p0, v9}, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->executeNextState(Lcom/android/server/backup/BackupManagerService$BackupState;)V

    :cond_9
    throw v8
.end method

.method clearAgentState()V
    .locals 3

    .prologue
    .line 3170
    :try_start_0
    iget-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mSavedState:Landroid/os/ParcelFileDescriptor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mSavedState:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3

    .line 3171
    :cond_0
    :goto_0
    :try_start_1
    iget-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mBackupData:Landroid/os/ParcelFileDescriptor;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mBackupData:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    .line 3172
    :cond_1
    :goto_1
    :try_start_2
    iget-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mNewState:Landroid/os/ParcelFileDescriptor;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mNewState:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 3173
    :cond_2
    :goto_2
    iget-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v1, v0, Lcom/android/server/backup/BackupManagerService;->mCurrentOpLock:Ljava/lang/Object;

    monitor-enter v1

    .line 3177
    :try_start_3
    iget-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v0, v0, Lcom/android/server/backup/BackupManagerService;->mCurrentOperations:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 3178
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mNewState:Landroid/os/ParcelFileDescriptor;

    iput-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mBackupData:Landroid/os/ParcelFileDescriptor;

    iput-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mSavedState:Landroid/os/ParcelFileDescriptor;

    .line 3179
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 3182
    iget-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    if-eqz v0, :cond_3

    .line 3183
    iget-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unbinding "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v2, v2, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 3185
    :try_start_4
    iget-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    # getter for: Lcom/android/server/backup/BackupManagerService;->mActivityManager:Landroid/app/IActivityManager;
    invoke-static {v0}, Lcom/android/server/backup/BackupManagerService;->access$700(Lcom/android/server/backup/BackupManagerService;)Landroid/app/IActivityManager;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    invoke-interface {v0, v1}, Landroid/app/IActivityManager;->unbindBackupAgent(Landroid/content/pm/ApplicationInfo;)V
    :try_end_4
    .catch Landroid/os/RemoteException; {:try_start_4 .. :try_end_4} :catch_0

    .line 3188
    :cond_3
    :goto_3
    return-void

    .line 3179
    :catchall_0
    move-exception v0

    :try_start_5
    monitor-exit v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    throw v0

    .line 3186
    :catch_0
    move-exception v0

    goto :goto_3

    .line 3172
    :catch_1
    move-exception v0

    goto :goto_2

    .line 3171
    :catch_2
    move-exception v0

    goto :goto_1

    .line 3170
    :catch_3
    move-exception v0

    goto :goto_0
.end method

.method clearMetadata()V
    .locals 3

    .prologue
    .line 2818
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStateDir:Ljava/io/File;

    const-string v2, "@pm@"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 2819
    .local v0, "pmState":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 2820
    :cond_0
    return-void
.end method

.method public execute()V
    .locals 2

    .prologue
    .line 2520
    sget-object v0, Lcom/android/server/backup/BackupManagerService$6;->$SwitchMap$com$android$server$backup$BackupManagerService$BackupState:[I

    iget-object v1, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mCurrentState:Lcom/android/server/backup/BackupManagerService$BackupState;

    invoke-virtual {v1}, Lcom/android/server/backup/BackupManagerService$BackupState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 2537
    :goto_0
    return-void

    .line 2522
    :pswitch_0
    invoke-virtual {p0}, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->beginBackup()V

    goto :goto_0

    .line 2526
    :pswitch_1
    invoke-virtual {p0}, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->invokeNextAgent()V

    goto :goto_0

    .line 2530
    :pswitch_2
    iget-boolean v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mFinished:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->finalizeBackup()V

    .line 2534
    :goto_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mFinished:Z

    goto :goto_0

    .line 2532
    :cond_0
    const-string v0, "PerformBackupTask"

    const-string v1, "Duplicate finish"

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 2520
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method executeNextState(Lcom/android/server/backup/BackupManagerService$BackupState;)V
    .locals 4
    .param p1, "nextState"    # Lcom/android/server/backup/BackupManagerService$BackupState;

    .prologue
    .line 3193
    iget-object v1, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "executeNextState => "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 3194
    iput-object p1, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mCurrentState:Lcom/android/server/backup/BackupManagerService$BackupState;

    .line 3195
    iget-object v1, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v1, v1, Lcom/android/server/backup/BackupManagerService;->mBackupHandler:Lcom/android/server/backup/BackupManagerService$BackupHandler;

    const/16 v2, 0x14

    invoke-virtual {v1, v2, p0}, Lcom/android/server/backup/BackupManagerService$BackupHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 3196
    .local v0, "msg":Landroid/os/Message;
    iget-object v1, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v1, v1, Lcom/android/server/backup/BackupManagerService;->mBackupHandler:Lcom/android/server/backup/BackupManagerService$BackupHandler;

    invoke-virtual {v1, v0}, Lcom/android/server/backup/BackupManagerService$BackupHandler;->sendMessage(Landroid/os/Message;)Z

    .line 3197
    return-void
.end method

.method public failAgent(Landroid/app/IBackupAgent;Ljava/lang/String;)V
    .locals 4
    .param p1, "agent"    # Landroid/app/IBackupAgent;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 2895
    :try_start_0
    invoke-interface {p1, p2}, Landroid/app/IBackupAgent;->fail(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2899
    :goto_0
    return-void

    .line 2896
    :catch_0
    move-exception v0

    .line 2897
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "PerformBackupTask"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error conveying failure to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v3, v3, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method finalizeBackup()V
    .locals 6

    .prologue
    .line 2771
    iget-object v1, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    const-string v2, "finishing"

    invoke-virtual {v1, v2}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2777
    iget-object v1, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mJournal:Ljava/io/File;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mJournal:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    move-result v1

    if-nez v1, :cond_0

    .line 2778
    const-string v1, "PerformBackupTask"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unable to remove backup journal file "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mJournal:Ljava/io/File;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2784
    :cond_0
    iget-object v1, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-wide v2, v1, Lcom/android/server/backup/BackupManagerService;->mCurrentToken:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-nez v1, :cond_1

    iget v1, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    if-nez v1, :cond_1

    .line 2785
    iget-object v1, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    const-string v2, "success; recording token"

    invoke-virtual {v1, v2}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2787
    :try_start_0
    iget-object v1, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v2, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    invoke-interface {v2}, Lcom/android/internal/backup/IBackupTransport;->getCurrentRestoreSet()J

    move-result-wide v2

    iput-wide v2, v1, Lcom/android/server/backup/BackupManagerService;->mCurrentToken:J

    .line 2788
    iget-object v1, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    invoke-virtual {v1}, Lcom/android/server/backup/BackupManagerService;->writeRestoreTokens()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2799
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v2, v1, Lcom/android/server/backup/BackupManagerService;->mQueueLock:Ljava/lang/Object;

    monitor-enter v2

    .line 2800
    :try_start_1
    iget-object v1, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    const/4 v3, 0x0

    iput-boolean v3, v1, Lcom/android/server/backup/BackupManagerService;->mBackupRunning:Z

    .line 2801
    iget v1, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    const/16 v3, -0x3e9

    if-ne v1, v3, :cond_2

    .line 2803
    invoke-virtual {p0}, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->clearMetadata()V

    .line 2805
    iget-object v1, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    const-string v3, "init required; rerunning"

    invoke-virtual {v1, v3}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2806
    iget-object v1, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    invoke-virtual {v1}, Lcom/android/server/backup/BackupManagerService;->backupNow()V

    .line 2808
    :cond_2
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2811
    iget-object v1, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    invoke-virtual {v1}, Lcom/android/server/backup/BackupManagerService;->clearBackupTrace()V

    .line 2812
    const-string v1, "BackupManagerService"

    const-string v2, "Backup pass finished."

    invoke-static {v1, v2}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2813
    iget-object v1, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v1, v1, Lcom/android/server/backup/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 2814
    return-void

    .line 2789
    :catch_0
    move-exception v0

    .line 2792
    .local v0, "e":Landroid/os/RemoteException;
    iget-object v1, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    const-string v2, "transport threw returning token"

    invoke-virtual {v1, v2}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    goto :goto_0

    .line 2808
    .end local v0    # "e":Landroid/os/RemoteException;
    :catchall_0
    move-exception v1

    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method public handleTimeout()V
    .locals 4

    .prologue
    .line 3131
    const-string v0, "PerformBackupTask"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Timeout backing up "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v2, v2, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3132
    const/16 v0, 0xb07

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v3, v3, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "timeout"

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I

    .line 3134
    iget-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "timeout of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v2, v2, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 3135
    invoke-virtual {p0}, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->agentErrorCleanup()V

    .line 3136
    iget-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v1, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    # invokes: Lcom/android/server/backup/BackupManagerService;->dataChangedImpl(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/android/server/backup/BackupManagerService;->access$500(Lcom/android/server/backup/BackupManagerService;Ljava/lang/String;)V

    .line 3137
    return-void
.end method

.method invokeAgentForBackup(Ljava/lang/String;Landroid/app/IBackupAgent;Lcom/android/internal/backup/IBackupTransport;)I
    .locals 8
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "agent"    # Landroid/app/IBackupAgent;
    .param p3, "transport"    # Lcom/android/internal/backup/IBackupTransport;

    .prologue
    const/4 v7, 0x0

    const/4 v5, 0x0

    .line 2826
    const-string v0, "PerformBackupTask"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invokeAgentForBackup on "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2827
    iget-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invoking "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2829
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStateDir:Ljava/io/File;

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mSavedStateName:Ljava/io/File;

    .line 2830
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v1, v1, Lcom/android/server/backup/BackupManagerService;->mDataDir:Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".data"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mBackupDataName:Ljava/io/File;

    .line 2831
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStateDir:Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".new"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mNewStateName:Ljava/io/File;

    .line 2834
    iput-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mSavedState:Landroid/os/ParcelFileDescriptor;

    .line 2835
    iput-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mBackupData:Landroid/os/ParcelFileDescriptor;

    .line 2836
    iput-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mNewState:Landroid/os/ParcelFileDescriptor;

    .line 2838
    iget-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    invoke-virtual {v0}, Lcom/android/server/backup/BackupManagerService;->generateToken()I

    move-result v4

    .line 2843
    .local v4, "token":I
    :try_start_0
    const-string v0, "@pm@"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2846
    new-instance v0, Landroid/content/pm/PackageInfo;

    invoke-direct {v0}, Landroid/content/pm/PackageInfo;-><init>()V

    iput-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    .line 2847
    iget-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iput-object p1, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    .line 2853
    :cond_0
    iget-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mSavedStateName:Ljava/io/File;

    const/high16 v1, 0x18000000

    invoke-static {v0, v1}, Landroid/os/ParcelFileDescriptor;->open(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mSavedState:Landroid/os/ParcelFileDescriptor;

    .line 2857
    iget-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mBackupDataName:Ljava/io/File;

    const/high16 v1, 0x3c000000    # 0.0078125f

    invoke-static {v0, v1}, Landroid/os/ParcelFileDescriptor;->open(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mBackupData:Landroid/os/ParcelFileDescriptor;

    .line 2862
    iget-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mBackupDataName:Ljava/io/File;

    invoke-static {v0}, Landroid/os/SELinux;->restorecon(Ljava/io/File;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 2863
    const-string v0, "PerformBackupTask"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SELinux restorecon failed on "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mBackupDataName:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2866
    :cond_1
    iget-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mNewStateName:Ljava/io/File;

    const/high16 v1, 0x3c000000    # 0.0078125f

    invoke-static {v0, v1}, Landroid/os/ParcelFileDescriptor;->open(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mNewState:Landroid/os/ParcelFileDescriptor;

    .line 2872
    iget-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    const-string v1, "setting timeout"

    invoke-virtual {v0, v1}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2873
    iget-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    const-wide/16 v2, 0x7530

    invoke-virtual {v0, v4, v2, v3, p0}, Lcom/android/server/backup/BackupManagerService;->prepareOperationTimeout(IJLcom/android/server/backup/BackupManagerService$BackupRestoreTask;)V

    .line 2874
    iget-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    const-string v1, "calling agent doBackup()"

    invoke-virtual {v0, v1}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2875
    iget-object v1, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mSavedState:Landroid/os/ParcelFileDescriptor;

    iget-object v2, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mBackupData:Landroid/os/ParcelFileDescriptor;

    iget-object v3, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mNewState:Landroid/os/ParcelFileDescriptor;

    iget-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v5, v0, Lcom/android/server/backup/BackupManagerService;->mBackupManagerBinder:Landroid/app/backup/IBackupManager;

    move-object v0, p2

    invoke-interface/range {v0 .. v5}, Landroid/app/IBackupAgent;->doBackup(Landroid/os/ParcelFileDescriptor;Landroid/os/ParcelFileDescriptor;Landroid/os/ParcelFileDescriptor;ILandroid/app/backup/IBackupManager;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2889
    iget-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    const-string v1, "invoke success"

    invoke-virtual {v0, v1}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    move v0, v7

    .line 2890
    :goto_0
    return v0

    .line 2876
    :catch_0
    move-exception v6

    .line 2877
    .local v6, "e":Ljava/lang/Exception;
    const-string v0, "PerformBackupTask"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error invoking for backup on "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2878
    iget-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "exception: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2879
    const/16 v0, 0xb07

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p1, v1, v7

    const/4 v2, 0x1

    invoke-virtual {v6}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I

    .line 2881
    invoke-virtual {p0}, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->agentErrorCleanup()V

    .line 2882
    const/16 v0, -0x3eb

    goto :goto_0
.end method

.method invokeNextAgent()V
    .locals 12

    .prologue
    const/16 v11, -0x3ec

    const/16 v10, -0x3eb

    const/4 v9, 0x0

    const/4 v6, 0x0

    .line 2652
    iput v6, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    .line 2653
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "invoke q="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mQueue:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2657
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mQueue:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 2659
    sget-object v5, Lcom/android/server/backup/BackupManagerService$BackupState;->FINAL:Lcom/android/server/backup/BackupManagerService$BackupState;

    invoke-virtual {p0, v5}, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->executeNextState(Lcom/android/server/backup/BackupManagerService$BackupState;)V

    .line 2768
    :goto_0
    return-void

    .line 2664
    :cond_0
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mQueue:Ljava/util/ArrayList;

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/server/backup/BackupManagerService$BackupRequest;

    .line 2665
    .local v4, "request":Lcom/android/server/backup/BackupManagerService$BackupRequest;
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mQueue:Ljava/util/ArrayList;

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 2667
    const-string v5, "PerformBackupTask"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "starting key/value backup of "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2668
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "launch agent for "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v4, Lcom/android/server/backup/BackupManagerService$BackupRequest;->packageName:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2676
    :try_start_0
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    # getter for: Lcom/android/server/backup/BackupManagerService;->mPackageManager:Landroid/content/pm/PackageManager;
    invoke-static {v5}, Lcom/android/server/backup/BackupManagerService;->access$400(Lcom/android/server/backup/BackupManagerService;)Landroid/content/pm/PackageManager;

    move-result-object v5

    iget-object v7, v4, Lcom/android/server/backup/BackupManagerService$BackupRequest;->packageName:Ljava/lang/String;

    const/16 v8, 0x40

    invoke-virtual {v5, v7, v8}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v5

    iput-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    .line 2678
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v5, v5, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    invoke-static {v5}, Lcom/android/server/backup/BackupManagerService;->appIsEligibleForBackup(Landroid/content/pm/ApplicationInfo;)Z

    move-result v5

    if-nez v5, :cond_5

    .line 2682
    const-string v5, "PerformBackupTask"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Package "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v4, Lcom/android/server/backup/BackupManagerService$BackupRequest;->packageName:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " no longer supports backup; skipping"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2684
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    const-string v7, "skipping - not eligible, completion is noop"

    invoke-virtual {v5, v7}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2685
    sget-object v5, Lcom/android/server/backup/BackupManagerService$BackupState;->RUNNING_QUEUE:Lcom/android/server/backup/BackupManagerService$BackupState;

    invoke-virtual {p0, v5}, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->executeNextState(Lcom/android/server/backup/BackupManagerService$BackupState;)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2736
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v5, v5, Lcom/android/server/backup/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v5, v9}, Landroid/os/PowerManager$WakeLock;->setWorkSource(Landroid/os/WorkSource;)V

    .line 2740
    iget v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    if-eqz v5, :cond_4

    .line 2741
    sget-object v3, Lcom/android/server/backup/BackupManagerService$BackupState;->RUNNING_QUEUE:Lcom/android/server/backup/BackupManagerService$BackupState;

    .line 2742
    .local v3, "nextState":Lcom/android/server/backup/BackupManagerService$BackupState;
    iput-object v9, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mAgentBinder:Landroid/app/IBackupAgent;

    .line 2746
    iget v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    if-ne v5, v10, :cond_2

    .line 2749
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v7, v4, Lcom/android/server/backup/BackupManagerService$BackupRequest;->packageName:Ljava/lang/String;

    # invokes: Lcom/android/server/backup/BackupManagerService;->dataChangedImpl(Ljava/lang/String;)V
    invoke-static {v5, v7}, Lcom/android/server/backup/BackupManagerService;->access$500(Lcom/android/server/backup/BackupManagerService;Ljava/lang/String;)V

    .line 2750
    iput v6, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    .line 2751
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mQueue:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_1

    sget-object v3, Lcom/android/server/backup/BackupManagerService$BackupState;->FINAL:Lcom/android/server/backup/BackupManagerService$BackupState;

    .line 2762
    :cond_1
    :goto_1
    invoke-virtual {p0, v3}, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->executeNextState(Lcom/android/server/backup/BackupManagerService$BackupState;)V

    goto/16 :goto_0

    .line 2752
    :cond_2
    iget v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    if-ne v5, v11, :cond_3

    .line 2755
    iput v6, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    goto :goto_1

    .line 2758
    :cond_3
    invoke-virtual {p0}, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->revertAndEndBackup()V

    .line 2759
    sget-object v3, Lcom/android/server/backup/BackupManagerService$BackupState;->FINAL:Lcom/android/server/backup/BackupManagerService$BackupState;

    goto :goto_1

    .line 2765
    .end local v3    # "nextState":Lcom/android/server/backup/BackupManagerService$BackupState;
    :cond_4
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    const-string v6, "expecting completion/timeout callback"

    invoke-virtual {v5, v6}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2689
    :cond_5
    :try_start_1
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    invoke-static {v5}, Lcom/android/server/backup/BackupManagerService;->appGetsFullBackup(Landroid/content/pm/PackageInfo;)Z

    move-result v5

    if-eqz v5, :cond_a

    .line 2693
    const-string v5, "PerformBackupTask"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Package "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v4, Lcom/android/server/backup/BackupManagerService$BackupRequest;->packageName:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " requests full-data rather than key/value; skipping"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2695
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    const-string v7, "skipping - fullBackupOnly, completion is noop"

    invoke-virtual {v5, v7}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2696
    sget-object v5, Lcom/android/server/backup/BackupManagerService$BackupState;->RUNNING_QUEUE:Lcom/android/server/backup/BackupManagerService$BackupState;

    invoke-virtual {p0, v5}, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->executeNextState(Lcom/android/server/backup/BackupManagerService$BackupState;)V
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2736
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v5, v5, Lcom/android/server/backup/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v5, v9}, Landroid/os/PowerManager$WakeLock;->setWorkSource(Landroid/os/WorkSource;)V

    .line 2740
    iget v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    if-eqz v5, :cond_9

    .line 2741
    sget-object v3, Lcom/android/server/backup/BackupManagerService$BackupState;->RUNNING_QUEUE:Lcom/android/server/backup/BackupManagerService$BackupState;

    .line 2742
    .restart local v3    # "nextState":Lcom/android/server/backup/BackupManagerService$BackupState;
    iput-object v9, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mAgentBinder:Landroid/app/IBackupAgent;

    .line 2746
    iget v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    if-ne v5, v10, :cond_7

    .line 2749
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v7, v4, Lcom/android/server/backup/BackupManagerService$BackupRequest;->packageName:Ljava/lang/String;

    # invokes: Lcom/android/server/backup/BackupManagerService;->dataChangedImpl(Ljava/lang/String;)V
    invoke-static {v5, v7}, Lcom/android/server/backup/BackupManagerService;->access$500(Lcom/android/server/backup/BackupManagerService;Ljava/lang/String;)V

    .line 2750
    iput v6, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    .line 2751
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mQueue:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_6

    sget-object v3, Lcom/android/server/backup/BackupManagerService$BackupState;->FINAL:Lcom/android/server/backup/BackupManagerService$BackupState;

    .line 2762
    :cond_6
    :goto_2
    invoke-virtual {p0, v3}, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->executeNextState(Lcom/android/server/backup/BackupManagerService$BackupState;)V

    goto/16 :goto_0

    .line 2752
    :cond_7
    iget v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    if-ne v5, v11, :cond_8

    .line 2755
    iput v6, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    goto :goto_2

    .line 2758
    :cond_8
    invoke-virtual {p0}, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->revertAndEndBackup()V

    .line 2759
    sget-object v3, Lcom/android/server/backup/BackupManagerService$BackupState;->FINAL:Lcom/android/server/backup/BackupManagerService$BackupState;

    goto :goto_2

    .line 2765
    .end local v3    # "nextState":Lcom/android/server/backup/BackupManagerService$BackupState;
    :cond_9
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    const-string v6, "expecting completion/timeout callback"

    invoke-virtual {v5, v6}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2700
    :cond_a
    :try_start_2
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v5, v5, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v5, v5, Landroid/content/pm/ApplicationInfo;->flags:I

    const/high16 v7, 0x200000

    and-int/2addr v5, v7

    if-eqz v5, :cond_f

    .line 2704
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    const-string v7, "skipping - stopped"

    invoke-virtual {v5, v7}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2705
    sget-object v5, Lcom/android/server/backup/BackupManagerService$BackupState;->RUNNING_QUEUE:Lcom/android/server/backup/BackupManagerService$BackupState;

    invoke-virtual {p0, v5}, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->executeNextState(Lcom/android/server/backup/BackupManagerService$BackupState;)V
    :try_end_2
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 2736
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v5, v5, Lcom/android/server/backup/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v5, v9}, Landroid/os/PowerManager$WakeLock;->setWorkSource(Landroid/os/WorkSource;)V

    .line 2740
    iget v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    if-eqz v5, :cond_e

    .line 2741
    sget-object v3, Lcom/android/server/backup/BackupManagerService$BackupState;->RUNNING_QUEUE:Lcom/android/server/backup/BackupManagerService$BackupState;

    .line 2742
    .restart local v3    # "nextState":Lcom/android/server/backup/BackupManagerService$BackupState;
    iput-object v9, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mAgentBinder:Landroid/app/IBackupAgent;

    .line 2746
    iget v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    if-ne v5, v10, :cond_c

    .line 2749
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v7, v4, Lcom/android/server/backup/BackupManagerService$BackupRequest;->packageName:Ljava/lang/String;

    # invokes: Lcom/android/server/backup/BackupManagerService;->dataChangedImpl(Ljava/lang/String;)V
    invoke-static {v5, v7}, Lcom/android/server/backup/BackupManagerService;->access$500(Lcom/android/server/backup/BackupManagerService;Ljava/lang/String;)V

    .line 2750
    iput v6, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    .line 2751
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mQueue:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_b

    sget-object v3, Lcom/android/server/backup/BackupManagerService$BackupState;->FINAL:Lcom/android/server/backup/BackupManagerService$BackupState;

    .line 2762
    :cond_b
    :goto_3
    invoke-virtual {p0, v3}, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->executeNextState(Lcom/android/server/backup/BackupManagerService$BackupState;)V

    goto/16 :goto_0

    .line 2752
    :cond_c
    iget v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    if-ne v5, v11, :cond_d

    .line 2755
    iput v6, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    goto :goto_3

    .line 2758
    :cond_d
    invoke-virtual {p0}, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->revertAndEndBackup()V

    .line 2759
    sget-object v3, Lcom/android/server/backup/BackupManagerService$BackupState;->FINAL:Lcom/android/server/backup/BackupManagerService$BackupState;

    goto :goto_3

    .line 2765
    .end local v3    # "nextState":Lcom/android/server/backup/BackupManagerService$BackupState;
    :cond_e
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    const-string v6, "expecting completion/timeout callback"

    invoke-virtual {v5, v6}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2709
    :cond_f
    const/4 v0, 0x0

    .line 2711
    .local v0, "agent":Landroid/app/IBackupAgent;
    :try_start_3
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v5, v5, Lcom/android/server/backup/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    new-instance v7, Landroid/os/WorkSource;

    iget-object v8, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v8, v8, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v8, v8, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-direct {v7, v8}, Landroid/os/WorkSource;-><init>(I)V

    invoke-virtual {v5, v7}, Landroid/os/PowerManager$WakeLock;->setWorkSource(Landroid/os/WorkSource;)V

    .line 2712
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v7, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v7, v7, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    const/4 v8, 0x0

    invoke-virtual {v5, v7, v8}, Lcom/android/server/backup/BackupManagerService;->bindToAgentSynchronous(Landroid/content/pm/ApplicationInfo;I)Landroid/app/IBackupAgent;

    move-result-object v0

    .line 2714
    iget-object v7, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "agent bound; a? = "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    if-eqz v0, :cond_11

    const/4 v5, 0x1

    :goto_4
    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v7, v5}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2715
    if-eqz v0, :cond_12

    .line 2716
    iput-object v0, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mAgentBinder:Landroid/app/IBackupAgent;

    .line 2717
    iget-object v5, v4, Lcom/android/server/backup/BackupManagerService$BackupRequest;->packageName:Ljava/lang/String;

    iget-object v7, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    invoke-virtual {p0, v5, v0, v7}, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->invokeAgentForBackup(Ljava/lang/String;Landroid/app/IBackupAgent;Lcom/android/internal/backup/IBackupTransport;)I

    move-result v5

    iput v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I
    :try_end_3
    .catch Ljava/lang/SecurityException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 2736
    :goto_5
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v5, v5, Lcom/android/server/backup/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v5, v9}, Landroid/os/PowerManager$WakeLock;->setWorkSource(Landroid/os/WorkSource;)V

    .line 2740
    iget v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    if-eqz v5, :cond_16

    .line 2741
    sget-object v3, Lcom/android/server/backup/BackupManagerService$BackupState;->RUNNING_QUEUE:Lcom/android/server/backup/BackupManagerService$BackupState;

    .line 2742
    .restart local v3    # "nextState":Lcom/android/server/backup/BackupManagerService$BackupState;
    iput-object v9, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mAgentBinder:Landroid/app/IBackupAgent;

    .line 2746
    iget v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    if-ne v5, v10, :cond_14

    .line 2749
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v7, v4, Lcom/android/server/backup/BackupManagerService$BackupRequest;->packageName:Ljava/lang/String;

    # invokes: Lcom/android/server/backup/BackupManagerService;->dataChangedImpl(Ljava/lang/String;)V
    invoke-static {v5, v7}, Lcom/android/server/backup/BackupManagerService;->access$500(Lcom/android/server/backup/BackupManagerService;Ljava/lang/String;)V

    .line 2750
    iput v6, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    .line 2751
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mQueue:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_10

    sget-object v3, Lcom/android/server/backup/BackupManagerService$BackupState;->FINAL:Lcom/android/server/backup/BackupManagerService$BackupState;

    .line 2762
    :cond_10
    :goto_6
    invoke-virtual {p0, v3}, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->executeNextState(Lcom/android/server/backup/BackupManagerService$BackupState;)V

    goto/16 :goto_0

    .end local v3    # "nextState":Lcom/android/server/backup/BackupManagerService$BackupState;
    :cond_11
    move v5, v6

    .line 2714
    goto :goto_4

    .line 2723
    :cond_12
    const/16 v5, -0x3eb

    :try_start_4
    iput v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I
    :try_end_4
    .catch Ljava/lang/SecurityException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_5

    .line 2725
    :catch_0
    move-exception v2

    .line 2727
    .local v2, "ex":Ljava/lang/SecurityException;
    :try_start_5
    const-string v5, "PerformBackupTask"

    const-string v7, "error in bind/backup"

    invoke-static {v5, v7, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 2728
    const/16 v5, -0x3eb

    iput v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    .line 2729
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    const-string v7, "agent SE"

    invoke-virtual {v5, v7}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V
    :try_end_5
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_5

    .line 2731
    .end local v0    # "agent":Landroid/app/IBackupAgent;
    .end local v2    # "ex":Ljava/lang/SecurityException;
    :catch_1
    move-exception v1

    .line 2732
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    :try_start_6
    const-string v5, "PerformBackupTask"

    const-string v7, "Package does not exist; skipping"

    invoke-static {v5, v7}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2733
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    const-string v7, "no such package"

    invoke-virtual {v5, v7}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2734
    const/16 v5, -0x3ec

    iput v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 2736
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v5, v5, Lcom/android/server/backup/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v5, v9}, Landroid/os/PowerManager$WakeLock;->setWorkSource(Landroid/os/WorkSource;)V

    .line 2740
    iget v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    if-eqz v5, :cond_19

    .line 2741
    sget-object v3, Lcom/android/server/backup/BackupManagerService$BackupState;->RUNNING_QUEUE:Lcom/android/server/backup/BackupManagerService$BackupState;

    .line 2742
    .restart local v3    # "nextState":Lcom/android/server/backup/BackupManagerService$BackupState;
    iput-object v9, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mAgentBinder:Landroid/app/IBackupAgent;

    .line 2746
    iget v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    if-ne v5, v10, :cond_17

    .line 2749
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v7, v4, Lcom/android/server/backup/BackupManagerService$BackupRequest;->packageName:Ljava/lang/String;

    # invokes: Lcom/android/server/backup/BackupManagerService;->dataChangedImpl(Ljava/lang/String;)V
    invoke-static {v5, v7}, Lcom/android/server/backup/BackupManagerService;->access$500(Lcom/android/server/backup/BackupManagerService;Ljava/lang/String;)V

    .line 2750
    iput v6, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    .line 2751
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mQueue:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_13

    sget-object v3, Lcom/android/server/backup/BackupManagerService$BackupState;->FINAL:Lcom/android/server/backup/BackupManagerService$BackupState;

    .line 2762
    :cond_13
    :goto_7
    invoke-virtual {p0, v3}, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->executeNextState(Lcom/android/server/backup/BackupManagerService$BackupState;)V

    goto/16 :goto_0

    .line 2752
    .end local v1    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    .restart local v0    # "agent":Landroid/app/IBackupAgent;
    :cond_14
    iget v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    if-ne v5, v11, :cond_15

    .line 2755
    iput v6, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    goto :goto_6

    .line 2758
    :cond_15
    invoke-virtual {p0}, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->revertAndEndBackup()V

    .line 2759
    sget-object v3, Lcom/android/server/backup/BackupManagerService$BackupState;->FINAL:Lcom/android/server/backup/BackupManagerService$BackupState;

    goto :goto_6

    .line 2765
    .end local v3    # "nextState":Lcom/android/server/backup/BackupManagerService$BackupState;
    :cond_16
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    const-string v6, "expecting completion/timeout callback"

    invoke-virtual {v5, v6}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2752
    .end local v0    # "agent":Landroid/app/IBackupAgent;
    .restart local v1    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    .restart local v3    # "nextState":Lcom/android/server/backup/BackupManagerService$BackupState;
    :cond_17
    iget v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    if-ne v5, v11, :cond_18

    .line 2755
    iput v6, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    goto :goto_7

    .line 2758
    :cond_18
    invoke-virtual {p0}, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->revertAndEndBackup()V

    .line 2759
    sget-object v3, Lcom/android/server/backup/BackupManagerService$BackupState;->FINAL:Lcom/android/server/backup/BackupManagerService$BackupState;

    goto :goto_7

    .line 2765
    .end local v3    # "nextState":Lcom/android/server/backup/BackupManagerService$BackupState;
    :cond_19
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    const-string v6, "expecting completion/timeout callback"

    invoke-virtual {v5, v6}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2736
    .end local v1    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    :catchall_0
    move-exception v5

    iget-object v7, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v7, v7, Lcom/android/server/backup/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v7, v9}, Landroid/os/PowerManager$WakeLock;->setWorkSource(Landroid/os/WorkSource;)V

    .line 2740
    iget v7, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    if-eqz v7, :cond_1d

    .line 2741
    sget-object v3, Lcom/android/server/backup/BackupManagerService$BackupState;->RUNNING_QUEUE:Lcom/android/server/backup/BackupManagerService$BackupState;

    .line 2742
    .restart local v3    # "nextState":Lcom/android/server/backup/BackupManagerService$BackupState;
    iput-object v9, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mAgentBinder:Landroid/app/IBackupAgent;

    .line 2746
    iget v7, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    if-ne v7, v10, :cond_1b

    .line 2749
    iget-object v7, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v8, v4, Lcom/android/server/backup/BackupManagerService$BackupRequest;->packageName:Ljava/lang/String;

    # invokes: Lcom/android/server/backup/BackupManagerService;->dataChangedImpl(Ljava/lang/String;)V
    invoke-static {v7, v8}, Lcom/android/server/backup/BackupManagerService;->access$500(Lcom/android/server/backup/BackupManagerService;Ljava/lang/String;)V

    .line 2750
    iput v6, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    .line 2751
    iget-object v6, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mQueue:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_1a

    sget-object v3, Lcom/android/server/backup/BackupManagerService$BackupState;->FINAL:Lcom/android/server/backup/BackupManagerService$BackupState;

    .line 2762
    :cond_1a
    :goto_8
    invoke-virtual {p0, v3}, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->executeNextState(Lcom/android/server/backup/BackupManagerService$BackupState;)V

    .line 2765
    .end local v3    # "nextState":Lcom/android/server/backup/BackupManagerService$BackupState;
    :goto_9
    throw v5

    .line 2752
    .restart local v3    # "nextState":Lcom/android/server/backup/BackupManagerService$BackupState;
    :cond_1b
    iget v7, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    if-ne v7, v11, :cond_1c

    .line 2755
    iput v6, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    goto :goto_8

    .line 2758
    :cond_1c
    invoke-virtual {p0}, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->revertAndEndBackup()V

    .line 2759
    sget-object v3, Lcom/android/server/backup/BackupManagerService$BackupState;->FINAL:Lcom/android/server/backup/BackupManagerService$BackupState;

    goto :goto_8

    .line 2765
    .end local v3    # "nextState":Lcom/android/server/backup/BackupManagerService$BackupState;
    :cond_1d
    iget-object v6, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    const-string v7, "expecting completion/timeout callback"

    invoke-virtual {v6, v7}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    goto :goto_9
.end method

.method public operationComplete(I)V
    .locals 19
    .param p1, "unusedResult"    # I

    .prologue
    .line 2983
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mBackupData:Landroid/os/ParcelFileDescriptor;

    if-nez v15, :cond_2

    .line 2988
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    if-eqz v15, :cond_1

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v11, v15, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    .line 2993
    .local v11, "pkg":Ljava/lang/String;
    :goto_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "late opComplete; curPkg = "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 3123
    .end local v11    # "pkg":Ljava/lang/String;
    :cond_0
    :goto_1
    return-void

    .line 2988
    :cond_1
    const-string v11, "[none]"

    goto :goto_0

    .line 2997
    :cond_2
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v12, v15, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    .line 2998
    .local v12, "pkgName":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mBackupDataName:Ljava/io/File;

    invoke-virtual {v15}, Ljava/io/File;->length()J

    move-result-wide v6

    .line 2999
    .local v6, "filepos":J
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mBackupData:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v15}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v5

    .line 3003
    .local v5, "fd":Ljava/io/FileDescriptor;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v15, v15, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    if-eqz v15, :cond_a

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v15, v15, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v15, v15, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v15, v15, 0x1

    if-nez v15, :cond_a

    .line 3005
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mBackupDataName:Ljava/io/File;

    const/high16 v16, 0x10000000

    invoke-static/range {v15 .. v16}, Landroid/os/ParcelFileDescriptor;->open(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;

    move-result-object v13

    .line 3007
    .local v13, "readFd":Landroid/os/ParcelFileDescriptor;
    new-instance v8, Landroid/app/backup/BackupDataInput;

    invoke-virtual {v13}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v15

    invoke-direct {v8, v15}, Landroid/app/backup/BackupDataInput;-><init>(Ljava/io/FileDescriptor;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 3009
    .local v8, "in":Landroid/app/backup/BackupDataInput;
    :goto_2
    :try_start_1
    invoke-virtual {v8}, Landroid/app/backup/BackupDataInput;->readNextHeader()Z

    move-result v15

    if-eqz v15, :cond_9

    .line 3010
    invoke-virtual {v8}, Landroid/app/backup/BackupDataInput;->getKey()Ljava/lang/String;

    move-result-object v9

    .line 3011
    .local v9, "key":Ljava/lang/String;
    if-eqz v9, :cond_7

    const/4 v15, 0x0

    invoke-virtual {v9, v15}, Ljava/lang/String;->charAt(I)C

    move-result v15

    const v16, 0xff00

    move/from16 v0, v16

    if-lt v15, v0, :cond_7

    .line 3013
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mAgentBinder:Landroid/app/IBackupAgent;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Illegal backup key: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v15, v1}, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->failAgent(Landroid/app/IBackupAgent;Ljava/lang/String;)V

    .line 3014
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "illegal key "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, " from "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 3015
    const/16 v15, 0xb07

    const/16 v16, 0x2

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    aput-object v12, v16, v17

    const/16 v17, 0x1

    const-string v18, "bad key"

    aput-object v18, v16, v17

    invoke-static/range {v15 .. v16}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I

    .line 3017
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v15, v15, Lcom/android/server/backup/BackupManagerService;->mBackupHandler:Lcom/android/server/backup/BackupManagerService$BackupHandler;

    const/16 v16, 0x7

    invoke-virtual/range {v15 .. v16}, Lcom/android/server/backup/BackupManagerService$BackupHandler;->removeMessages(I)V

    .line 3018
    invoke-virtual/range {p0 .. p0}, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->agentErrorCleanup()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 3025
    if-eqz v13, :cond_0

    .line 3026
    :try_start_2
    invoke-virtual {v13}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_1

    .line 3033
    .end local v8    # "in":Landroid/app/backup/BackupDataInput;
    .end local v9    # "key":Ljava/lang/String;
    .end local v13    # "readFd":Landroid/os/ParcelFileDescriptor;
    :catch_0
    move-exception v3

    .line 3038
    .local v3, "e":Ljava/io/IOException;
    const-string v15, "PerformBackupTask"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Unable to save widget state for "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 3040
    :try_start_3
    invoke-static {v5, v6, v7}, Landroid/system/Os;->ftruncate(Ljava/io/FileDescriptor;J)V
    :try_end_3
    .catch Landroid/system/ErrnoException; {:try_start_3 .. :try_end_3} :catch_1

    .line 3049
    .end local v3    # "e":Ljava/io/IOException;
    :goto_3
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v15, v15, Lcom/android/server/backup/BackupManagerService;->mBackupHandler:Lcom/android/server/backup/BackupManagerService$BackupHandler;

    const/16 v16, 0x7

    invoke-virtual/range {v15 .. v16}, Lcom/android/server/backup/BackupManagerService$BackupHandler;->removeMessages(I)V

    .line 3050
    invoke-virtual/range {p0 .. p0}, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->clearAgentState()V

    .line 3051
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    const-string v16, "operation complete"

    invoke-virtual/range {v15 .. v16}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 3053
    const/4 v2, 0x0

    .line 3054
    .local v2, "backupData":Landroid/os/ParcelFileDescriptor;
    const/4 v15, 0x0

    move-object/from16 v0, p0

    iput v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    .line 3056
    :try_start_4
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mBackupDataName:Ljava/io/File;

    invoke-virtual {v15}, Ljava/io/File;->length()J

    move-result-wide v16

    move-wide/from16 v0, v16

    long-to-int v14, v0

    .line 3057
    .local v14, "size":I
    if-lez v14, :cond_c

    .line 3058
    move-object/from16 v0, p0

    iget v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    if-nez v15, :cond_3

    .line 3059
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mBackupDataName:Ljava/io/File;

    const/high16 v16, 0x10000000

    invoke-static/range {v15 .. v16}, Landroid/os/ParcelFileDescriptor;->open(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;

    move-result-object v2

    .line 3061
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    const-string v16, "sending data to transport"

    invoke-virtual/range {v15 .. v16}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 3062
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-interface {v15, v0, v2}, Lcom/android/internal/backup/IBackupTransport;->performBackup(Landroid/content/pm/PackageInfo;Landroid/os/ParcelFileDescriptor;)I

    move-result v15

    move-object/from16 v0, p0

    iput v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    .line 3070
    :cond_3
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "data delivered: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    move/from16 v17, v0

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 3071
    move-object/from16 v0, p0

    iget v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    if-nez v15, :cond_b

    .line 3072
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    const-string v16, "finishing op on transport"

    invoke-virtual/range {v15 .. v16}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 3073
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    invoke-interface {v15}, Lcom/android/internal/backup/IBackupTransport;->finishBackup()I

    move-result v15

    move-object/from16 v0, p0

    iput v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    .line 3074
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "finished: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    move/from16 v17, v0

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 3083
    :cond_4
    :goto_4
    move-object/from16 v0, p0

    iget v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    if-nez v15, :cond_e

    .line 3087
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mBackupDataName:Ljava/io/File;

    invoke-virtual {v15}, Ljava/io/File;->delete()Z

    .line 3088
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mNewStateName:Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mSavedStateName:Ljava/io/File;

    move-object/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 3089
    const/16 v15, 0xb08

    const/16 v16, 0x2

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    aput-object v12, v16, v17

    const/16 v17, 0x1

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    invoke-static/range {v15 .. v16}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I

    .line 3090
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    invoke-virtual {v15, v12}, Lcom/android/server/backup/BackupManagerService;->logBackupComplete(Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 3106
    :goto_5
    if-eqz v2, :cond_5

    :try_start_5
    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4

    .line 3110
    .end local v14    # "size":I
    :cond_5
    :goto_6
    move-object/from16 v0, p0

    iget v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    if-eqz v15, :cond_6

    move-object/from16 v0, p0

    iget v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    const/16 v16, -0x3ea

    move/from16 v0, v16

    if-ne v15, v0, :cond_11

    .line 3114
    :cond_6
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mQueue:Ljava/util/ArrayList;

    invoke-virtual {v15}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v15

    if-eqz v15, :cond_10

    sget-object v10, Lcom/android/server/backup/BackupManagerService$BackupState;->FINAL:Lcom/android/server/backup/BackupManagerService$BackupState;

    .line 3122
    .local v10, "nextState":Lcom/android/server/backup/BackupManagerService$BackupState;
    :goto_7
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->executeNextState(Lcom/android/server/backup/BackupManagerService$BackupState;)V

    goto/16 :goto_1

    .line 3022
    .end local v2    # "backupData":Landroid/os/ParcelFileDescriptor;
    .end local v10    # "nextState":Lcom/android/server/backup/BackupManagerService$BackupState;
    .restart local v8    # "in":Landroid/app/backup/BackupDataInput;
    .restart local v9    # "key":Ljava/lang/String;
    .restart local v13    # "readFd":Landroid/os/ParcelFileDescriptor;
    :cond_7
    :try_start_6
    invoke-virtual {v8}, Landroid/app/backup/BackupDataInput;->skipEntityData()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto/16 :goto_2

    .line 3025
    .end local v9    # "key":Ljava/lang/String;
    :catchall_0
    move-exception v15

    if-eqz v13, :cond_8

    .line 3026
    :try_start_7
    invoke-virtual {v13}, Landroid/os/ParcelFileDescriptor;->close()V

    :cond_8
    throw v15

    .line 3025
    :cond_9
    if-eqz v13, :cond_a

    .line 3026
    invoke-virtual {v13}, Landroid/os/ParcelFileDescriptor;->close()V

    .line 3032
    .end local v8    # "in":Landroid/app/backup/BackupDataInput;
    .end local v13    # "readFd":Landroid/os/ParcelFileDescriptor;
    :cond_a
    move-object/from16 v0, p0

    invoke-direct {v0, v5, v12}, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->writeWidgetPayloadIfAppropriate(Ljava/io/FileDescriptor;Ljava/lang/String;)V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_0

    goto/16 :goto_3

    .line 3041
    .restart local v3    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v4

    .line 3042
    .local v4, "ee":Landroid/system/ErrnoException;
    const-string v15, "PerformBackupTask"

    const-string v16, "Unable to roll back!"

    invoke-static/range {v15 .. v16}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_3

    .line 3075
    .end local v3    # "e":Ljava/io/IOException;
    .end local v4    # "ee":Landroid/system/ErrnoException;
    .restart local v2    # "backupData":Landroid/os/ParcelFileDescriptor;
    .restart local v14    # "size":I
    :cond_b
    :try_start_8
    move-object/from16 v0, p0

    iget v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    const/16 v16, -0x3ea

    move/from16 v0, v16

    if-ne v15, v0, :cond_4

    .line 3076
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    const-string v16, "transport rejected package"

    invoke-virtual/range {v15 .. v16}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_2
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    goto/16 :goto_4

    .line 3101
    .end local v14    # "size":I
    :catch_2
    move-exception v3

    .line 3102
    .local v3, "e":Ljava/lang/Exception;
    :try_start_9
    const-string v15, "PerformBackupTask"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Transport error backing up "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-static {v15, v0, v3}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 3103
    const/16 v15, 0xb06

    invoke-static {v15, v12}, Landroid/util/EventLog;->writeEvent(ILjava/lang/String;)I

    .line 3104
    const/16 v15, -0x3e8

    move-object/from16 v0, p0

    iput v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 3106
    if-eqz v2, :cond_5

    :try_start_a
    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_3

    goto/16 :goto_6

    :catch_3
    move-exception v15

    goto/16 :goto_6

    .line 3080
    .end local v3    # "e":Ljava/lang/Exception;
    .restart local v14    # "size":I
    :cond_c
    :try_start_b
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    const-string v16, "no data to send"

    invoke-virtual/range {v15 .. v16}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_2
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    goto/16 :goto_4

    .line 3106
    .end local v14    # "size":I
    :catchall_1
    move-exception v15

    if-eqz v2, :cond_d

    :try_start_c
    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_5

    :cond_d
    :goto_8
    throw v15

    .line 3091
    .restart local v14    # "size":I
    :cond_e
    :try_start_d
    move-object/from16 v0, p0

    iget v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mStatus:I

    const/16 v16, -0x3ea

    move/from16 v0, v16

    if-ne v15, v0, :cond_f

    .line 3094
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mBackupDataName:Ljava/io/File;

    invoke-virtual {v15}, Ljava/io/File;->delete()Z

    .line 3095
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mNewStateName:Ljava/io/File;

    invoke-virtual {v15}, Ljava/io/File;->delete()Z

    .line 3096
    const-string v15, "Transport rejected"

    invoke-static {v12, v15}, Lcom/android/server/EventLogTags;->writeBackupAgentFailure(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_5

    .line 3099
    :cond_f
    const/16 v15, 0xb06

    invoke-static {v15, v12}, Landroid/util/EventLog;->writeEvent(ILjava/lang/String;)I
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_2
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    goto/16 :goto_5

    .line 3114
    .end local v14    # "size":I
    :cond_10
    sget-object v10, Lcom/android/server/backup/BackupManagerService$BackupState;->RUNNING_QUEUE:Lcom/android/server/backup/BackupManagerService$BackupState;

    goto/16 :goto_7

    .line 3118
    :cond_11
    invoke-virtual/range {p0 .. p0}, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->revertAndEndBackup()V

    .line 3119
    sget-object v10, Lcom/android/server/backup/BackupManagerService$BackupState;->FINAL:Lcom/android/server/backup/BackupManagerService$BackupState;

    .restart local v10    # "nextState":Lcom/android/server/backup/BackupManagerService$BackupState;
    goto/16 :goto_7

    .line 3106
    .end local v10    # "nextState":Lcom/android/server/backup/BackupManagerService$BackupState;
    .restart local v14    # "size":I
    :catch_4
    move-exception v15

    goto/16 :goto_6

    .end local v14    # "size":I
    :catch_5
    move-exception v16

    goto :goto_8
.end method

.method revertAndEndBackup()V
    .locals 7

    .prologue
    .line 3141
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    const-string v6, "transport error; reverting"

    invoke-virtual {v5, v6}, Lcom/android/server/backup/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 3147
    :try_start_0
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    invoke-interface {v5}, Lcom/android/internal/backup/IBackupTransport;->requestBackupTime()J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v0

    .line 3152
    .local v0, "delay":J
    :goto_0
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v5, v5, Lcom/android/server/backup/BackupManagerService;->mContext:Landroid/content/Context;

    invoke-static {v5, v0, v1}, Lcom/android/server/backup/KeyValueBackupJob;->schedule(Landroid/content/Context;J)V

    .line 3154
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->mOriginalQueue:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/server/backup/BackupManagerService$BackupRequest;

    .line 3155
    .local v4, "request":Lcom/android/server/backup/BackupManagerService$BackupRequest;
    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v6, v4, Lcom/android/server/backup/BackupManagerService$BackupRequest;->packageName:Ljava/lang/String;

    # invokes: Lcom/android/server/backup/BackupManagerService;->dataChangedImpl(Ljava/lang/String;)V
    invoke-static {v5, v6}, Lcom/android/server/backup/BackupManagerService;->access$500(Lcom/android/server/backup/BackupManagerService;Ljava/lang/String;)V

    goto :goto_1

    .line 3148
    .end local v0    # "delay":J
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "request":Lcom/android/server/backup/BackupManagerService$BackupRequest;
    :catch_0
    move-exception v2

    .line 3149
    .local v2, "e":Ljava/lang/Exception;
    const-string v5, "PerformBackupTask"

    const-string v6, "Unable to contact transport for recommended backoff"

    invoke-static {v5, v6}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 3150
    const-wide/16 v0, 0x0

    .restart local v0    # "delay":J
    goto :goto_0

    .line 3158
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v3    # "i$":Ljava/util/Iterator;
    :cond_0
    return-void
.end method
