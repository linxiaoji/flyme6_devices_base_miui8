.class public Lcom/android/internal/os/RegionalizationEnvironment;
.super Ljava/lang/Object;
.source "RegionalizationEnvironment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/os/RegionalizationEnvironment$Package;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = true

.field private static final SPEC_FILE_PATH:Ljava/lang/String; = "/persist/speccfg/spec"

.field private static final SUPPORTED:Z

.field private static final TAG:Ljava/lang/String; = "RegionalizationEnvironment"

.field private static isLoaded:Z

.field private static mExcludedApps:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static mPackages:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/internal/os/RegionalizationEnvironment$Package;",
            ">;"
        }
    .end annotation
.end field

.field private static mRegionalizationService:Lcom/android/internal/os/IRegionalizationService;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const-string v0, "ro.regionalization.support"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/android/internal/os/RegionalizationEnvironment;->SUPPORTED:Z

    const/4 v0, 0x0

    sput-object v0, Lcom/android/internal/os/RegionalizationEnvironment;->mRegionalizationService:Lcom/android/internal/os/IRegionalizationService;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/android/internal/os/RegionalizationEnvironment;->mPackages:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/android/internal/os/RegionalizationEnvironment;->mExcludedApps:Ljava/util/ArrayList;

    sput-boolean v1, Lcom/android/internal/os/RegionalizationEnvironment;->isLoaded:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAllPackageDirectories()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .prologue
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .local v0, "directories":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/io/File;>;"
    sget-object v3, Lcom/android/internal/os/RegionalizationEnvironment;->mPackages:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/internal/os/RegionalizationEnvironment$Package;

    .local v2, "p":Lcom/android/internal/os/RegionalizationEnvironment$Package;
    const-string v3, "RegionalizationEnvironment"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Package Directoriy("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Lcom/android/internal/os/RegionalizationEnvironment$Package;->getPriority()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "):"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Lcom/android/internal/os/RegionalizationEnvironment$Package;->getDirectory()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v2}, Lcom/android/internal/os/RegionalizationEnvironment$Package;->getDirectory()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .end local v2    # "p":Lcom/android/internal/os/RegionalizationEnvironment$Package;
    :cond_0
    return-object v0
.end method

.method public static getAllPackageNames()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .local v2, "packages":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    sget-object v3, Lcom/android/internal/os/RegionalizationEnvironment;->mPackages:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/os/RegionalizationEnvironment$Package;

    .local v1, "p":Lcom/android/internal/os/RegionalizationEnvironment$Package;
    invoke-virtual {v1}, Lcom/android/internal/os/RegionalizationEnvironment$Package;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .end local v1    # "p":Lcom/android/internal/os/RegionalizationEnvironment$Package;
    :cond_0
    return-object v2
.end method

.method public static getPackagesCount()I
    .locals 1

    .prologue
    sget-object v0, Lcom/android/internal/os/RegionalizationEnvironment;->mPackages:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public static getRegionalizationService()Lcom/android/internal/os/IRegionalizationService;
    .locals 1

    .prologue
    sget-object v0, Lcom/android/internal/os/RegionalizationEnvironment;->mRegionalizationService:Lcom/android/internal/os/IRegionalizationService;

    return-object v0
.end method

.method public static getStoragePos()Ljava/lang/String;
    .locals 7

    .prologue
    sget-object v4, Lcom/android/internal/os/RegionalizationEnvironment;->mPackages:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/internal/os/RegionalizationEnvironment$Package;

    .local v2, "pack":Lcom/android/internal/os/RegionalizationEnvironment$Package;
    invoke-virtual {v2}, Lcom/android/internal/os/RegionalizationEnvironment$Package;->getStoragePos()Ljava/lang/String;

    move-result-object v3

    .local v3, "pos":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .end local v2    # "pack":Lcom/android/internal/os/RegionalizationEnvironment$Package;
    .end local v3    # "pos":Ljava/lang/String;
    :goto_0
    return-object v3

    :cond_1
    :try_start_0
    sget-object v4, Lcom/android/internal/os/RegionalizationEnvironment;->mPackages:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    new-instance v4, Ljava/io/IOException;

    const-string v5, "Read wrong package for Carrier!"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0

    .local v0, "e":Ljava/io/IOException;
    const-string v4, "RegionalizationEnvironment"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Get storage pos error, caused by: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const-string v3, ""

    goto :goto_0
.end method

.method private static init()V
    .locals 2

    .prologue
    const-string v1, "regionalization"

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    .local v0, "iBinder":Landroid/os/IBinder;
    invoke-static {v0}, Lcom/android/internal/os/IRegionalizationService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/os/IRegionalizationService;

    move-result-object v1

    sput-object v1, Lcom/android/internal/os/RegionalizationEnvironment;->mRegionalizationService:Lcom/android/internal/os/IRegionalizationService;

    sget-object v1, Lcom/android/internal/os/RegionalizationEnvironment;->mRegionalizationService:Lcom/android/internal/os/IRegionalizationService;

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/android/internal/os/RegionalizationEnvironment;->loadSwitchedPackages()V

    invoke-static {}, Lcom/android/internal/os/RegionalizationEnvironment;->loadExcludedApplist()V

    const/4 v1, 0x1

    sput-boolean v1, Lcom/android/internal/os/RegionalizationEnvironment;->isLoaded:Z

    :cond_0
    return-void
.end method

.method public static isExcludedApp(Ljava/lang/String;)Z
    .locals 3
    .param p0, "appName"    # Ljava/lang/String;

    .prologue
    invoke-static {}, Lcom/android/internal/os/RegionalizationEnvironment;->getPackagesCount()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const-string v0, ".apk"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lcom/android/internal/os/RegionalizationEnvironment;->mExcludedApps:Ljava/util/ArrayList;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".apk"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0

    :cond_1
    sget-object v0, Lcom/android/internal/os/RegionalizationEnvironment;->mExcludedApps:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method public static isSupported()Z
    .locals 1

    .prologue
    sget-boolean v0, Lcom/android/internal/os/RegionalizationEnvironment;->SUPPORTED:Z

    if-eqz v0, :cond_0

    sget-boolean v0, Lcom/android/internal/os/RegionalizationEnvironment;->isLoaded:Z

    if-nez v0, :cond_0

    invoke-static {}, Lcom/android/internal/os/RegionalizationEnvironment;->init()V

    :cond_0
    sget-boolean v0, Lcom/android/internal/os/RegionalizationEnvironment;->SUPPORTED:Z

    return v0
.end method

.method private static loadExcludedApplist()V
    .locals 13

    .prologue
    const-string v10, "RegionalizationEnvironment"

    const-string v11, "loadExcludedApps!"

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/android/internal/os/RegionalizationEnvironment;->getPackagesCount()I

    move-result v10

    if-nez v10, :cond_1

    .local v3, "contents":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local v5, "excListFilePath":Ljava/lang/String;
    .local v8, "pack":Lcom/android/internal/os/RegionalizationEnvironment$Package;
    :cond_0
    return-void

    .end local v3    # "contents":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v5    # "excListFilePath":Ljava/lang/String;
    .end local v8    # "pack":Lcom/android/internal/os/RegionalizationEnvironment$Package;
    :cond_1
    sget-object v10, Lcom/android/internal/os/RegionalizationEnvironment;->mPackages:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .restart local v3    # "contents":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v5    # "excListFilePath":Ljava/lang/String;
    .restart local v8    # "pack":Lcom/android/internal/os/RegionalizationEnvironment$Package;
    :cond_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "pack":Lcom/android/internal/os/RegionalizationEnvironment$Package;
    check-cast v8, Lcom/android/internal/os/RegionalizationEnvironment$Package;

    .restart local v8    # "pack":Lcom/android/internal/os/RegionalizationEnvironment$Package;
    const-string v10, "RegionalizationEnvironment"

    .end local v3    # "contents":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v5    # "excListFilePath":Ljava/lang/String;
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "load excluded apps for "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v8}, Lcom/android/internal/os/RegionalizationEnvironment$Package;->getDirectory()Ljava/io/File;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v8}, Lcom/android/internal/os/RegionalizationEnvironment$Package;->getExcludedListFilePath()Ljava/lang/String;

    move-result-object v5

    .restart local v5    # "excListFilePath":Ljava/lang/String;
    const/4 v3, 0x0

    .restart local v3    # "contents":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :try_start_0
    sget-object v10, Lcom/android/internal/os/RegionalizationEnvironment;->mRegionalizationService:Lcom/android/internal/os/IRegionalizationService;

    const/4 v11, 0x0

    invoke-interface {v10, v5, v11}, Lcom/android/internal/os/IRegionalizationService;->readFile(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v10

    move-object v0, v10

    check-cast v0, Ljava/util/ArrayList;

    move-object v3, v0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    if-eqz v3, :cond_2

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-lez v10, :cond_2

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "i$":Ljava/util/Iterator;
    :cond_3
    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .local v2, "content":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_3

    const-string v10, "/"

    invoke-virtual {v2, v10}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v9

    .local v9, "pos":I
    const/4 v10, -0x1

    if-eq v9, v10, :cond_3

    add-int/lit8 v10, v9, 0x1

    invoke-virtual {v2, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .local v1, "apkName":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_3

    sget-object v10, Lcom/android/internal/os/RegionalizationEnvironment;->mExcludedApps:Ljava/util/ArrayList;

    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_3

    sget-object v10, Lcom/android/internal/os/RegionalizationEnvironment;->mExcludedApps:Ljava/util/ArrayList;

    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .end local v1    # "apkName":Ljava/lang/String;
    .end local v2    # "content":Ljava/lang/String;
    .end local v7    # "i$":Ljava/util/Iterator;
    .end local v9    # "pos":I
    :catch_0
    move-exception v4

    .local v4, "e":Landroid/os/RemoteException;
    invoke-virtual {v4}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0
.end method

.method private static loadSwitchedPackages()V
    .locals 13

    .prologue
    const-string v10, "RegionalizationEnvironment"

    const-string v11, "load packages for Carrier!"

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x0

    .local v1, "contents":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :try_start_0
    sget-object v10, Lcom/android/internal/os/RegionalizationEnvironment;->mRegionalizationService:Lcom/android/internal/os/IRegionalizationService;

    const-string v11, "/persist/speccfg/spec"

    const/4 v12, 0x0

    invoke-interface {v10, v11, v12}, Lcom/android/internal/os/IRegionalizationService;->readFile(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v10

    move-object v0, v10

    check-cast v0, Ljava/util/ArrayList;

    move-object v1, v0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    if-eqz v1, :cond_0

    :try_start_1
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-lez v10, :cond_0

    const/4 v10, 0x0

    invoke-virtual {v1, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    const-string v11, "packStorage="

    invoke-virtual {v10, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_1

    new-instance v10, Ljava/io/IOException;

    const-string v11, "Can\'t read storage pos for Carrier package!"

    invoke-direct {v10, v11}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v10
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    move-exception v2

    .local v2, "e":Ljava/io/IOException;
    const-string v10, "RegionalizationEnvironment"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Load package for carrier error, caused by: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .end local v2    # "e":Ljava/io/IOException;
    :cond_0
    return-void

    :catch_1
    move-exception v2

    .local v2, "e":Landroid/os/RemoteException;
    :try_start_2
    invoke-virtual {v2}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0

    .end local v2    # "e":Landroid/os/RemoteException;
    :cond_1
    const/4 v10, 0x0

    invoke-virtual {v1, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    const-string v11, "packStorage="

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    .local v9, "storagePos":Ljava/lang/String;
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_2

    new-instance v10, Ljava/io/IOException;

    const-string v11, "Storage pos for Carrier package is wrong!"

    invoke-direct {v10, v11}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v10

    :cond_2
    const-string v7, "^packCount=[0-9]$"

    .local v7, "packNumRegularExpresstion":Ljava/lang/String;
    const/4 v10, 0x1

    invoke-virtual {v1, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-virtual {v10, v7}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_3

    new-instance v10, Ljava/io/IOException;

    const-string v11, "Can\'t read package count of Carrier!"

    invoke-direct {v10, v11}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v10

    :cond_3
    const/4 v10, 0x1

    invoke-virtual {v1, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    const-string v11, "packCount="

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    .local v6, "packNum":I
    if-lez v6, :cond_4

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-gt v10, v6, :cond_5

    :cond_4
    new-instance v10, Ljava/io/IOException;

    const-string v11, "Package count of Carrier is wrong!"

    invoke-direct {v10, v11}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v10

    :cond_5
    const/4 v4, 0x2

    .local v4, "i":I
    :goto_1
    add-int/lit8 v10, v6, 0x2

    if-ge v4, v10, :cond_0

    const-string v8, "^strSpec[0-9]=\\w+$"

    .local v8, "packRegularExpresstion":Ljava/lang/String;
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-virtual {v10, v8}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_8

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    const-string v11, "strSpec"

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v11

    add-int/lit8 v11, v11, 0x2

    invoke-virtual {v10, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .local v5, "packName":Ljava/lang/String;
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    move-result v10

    if-nez v10, :cond_6

    const/4 v3, 0x0

    .local v3, "exists":Z
    :try_start_3
    sget-object v10, Lcom/android/internal/os/RegionalizationEnvironment;->mRegionalizationService:Lcom/android/internal/os/IRegionalizationService;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "/"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v10, v11}, Lcom/android/internal/os/IRegionalizationService;->checkFileExists(Ljava/lang/String;)Z
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    move-result v3

    :goto_2
    if-eqz v3, :cond_7

    :try_start_4
    sget-object v10, Lcom/android/internal/os/RegionalizationEnvironment;->mPackages:Ljava/util/ArrayList;

    new-instance v11, Lcom/android/internal/os/RegionalizationEnvironment$Package;

    invoke-direct {v11, v5, v4, v9}, Lcom/android/internal/os/RegionalizationEnvironment$Package;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    invoke-virtual {v10, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .end local v3    # "exists":Z
    :cond_6
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .restart local v3    # "exists":Z
    :catch_2
    move-exception v2

    .restart local v2    # "e":Landroid/os/RemoteException;
    invoke-virtual {v2}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_2

    .end local v2    # "e":Landroid/os/RemoteException;
    :cond_7
    sget-object v10, Lcom/android/internal/os/RegionalizationEnvironment;->mPackages:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->clear()V

    new-instance v10, Ljava/io/IOException;

    const-string v11, "Read wrong packages for Carrier!"

    invoke-direct {v10, v11}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v10

    .end local v3    # "exists":Z
    .end local v5    # "packName":Ljava/lang/String;
    :cond_8
    sget-object v10, Lcom/android/internal/os/RegionalizationEnvironment;->mPackages:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->clear()V

    new-instance v10, Ljava/io/IOException;

    const-string v11, "Read wrong packages for Carrier!"

    invoke-direct {v10, v11}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v10
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
.end method
