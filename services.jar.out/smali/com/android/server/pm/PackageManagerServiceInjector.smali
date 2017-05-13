.class Lcom/android/server/pm/PackageManagerServiceInjector;
.super Ljava/lang/Object;
.source "PackageManagerServiceInjector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/pm/PackageManagerServiceInjector$InstallAppParam;,
        Lcom/android/server/pm/PackageManagerServiceInjector$PackageDeleteConfirmObserver;
    }
.end annotation


# static fields
.field private static final APP_LIST_FILE:Ljava/lang/String; = "/system/etc/install_app_filter.xml"

.field private static final BLOCK_APPS:[[Ljava/lang/String;

.field static DEBUG_CHANGE:Z = false

.field static final DELETE_FAILED_FORBIDED_BY_MIUI:I = -0x3e8

.field static final INSTALL_IGNORE_PACKAGE:I = -0x3e8

.field private static final IS_X7_LTE_ALL:Z

.field private static final MSG_INSTALL_APP_GOON:I = 0x0

.field private static final PACKAGE_INSTALLER_NAME:Ljava/lang/String; = "com.google.android.packageinstaller"

.field private static final PACKAGE_MIME_TYPE:Ljava/lang/String; = "application/vnd.android.package-archive"

.field private static final SUPPORT_OLDMAN_MODE:Ljava/lang/String; = "support_oldman_mode"

.field private static TAG:Ljava/lang/String; = null

.field private static final TAG_ADD_APPS:Ljava/lang/String; = "add_apps"

.field private static final TAG_APP:Ljava/lang/String; = "app"

.field private static final TAG_IGNORE_APPS:Ljava/lang/String; = "ignore_apps"

.field static mHandler:Landroid/os/Handler;

.field private static msBlockAppMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static sAllowPackage:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static sAppOpsService:Lcom/android/internal/app/IAppOpsService;

.field static sCrossXSpaceIntent:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static sIgnoreApks:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static sIgnorePackages:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static sNotDisable:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field static sShellCheckPermissions:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final sSilentlyUninstallPackages:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static sXSpaceFriendlyActionList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static updateSystemPackages:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/android/server/pm/PackageSetting;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 85
    const-class v0, Lcom/android/server/pm/PackageManagerServiceInjector;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->TAG:Ljava/lang/String;

    .line 91
    sput-boolean v4, Lcom/android/server/pm/PackageManagerServiceInjector;->DEBUG_CHANGE:Z

    .line 111
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sIgnoreApks:Ljava/util/Set;

    .line 112
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sIgnorePackages:Ljava/util/Set;

    .line 113
    const-string v0, "X7-LTE-ALL"

    const-string v1, "persist.radio.modem"

    invoke-static {v1}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/server/pm/PackageManagerServiceInjector;->IS_X7_LTE_ALL:Z

    .line 114
    new-instance v0, Landroid/util/ArrayMap;

    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    sput-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->updateSystemPackages:Landroid/util/ArrayMap;

    .line 115
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sSilentlyUninstallPackages:Ljava/util/Set;

    .line 118
    sget-boolean v0, Lmiui/os/Build;->IS_MIFOUR:Z

    if-eqz v0, :cond_0

    .line 119
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sIgnoreApks:Ljava/util/Set;

    const-string v1, "/system/app/TSMClient"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 120
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sIgnoreApks:Ljava/util/Set;

    const-string v1, "/system/app/NfcNci"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 121
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sIgnoreApks:Ljava/util/Set;

    const-string v1, "/system/priv-app/SmartcardService"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 124
    :cond_0
    const-string v0, "support_fm"

    invoke-static {v0, v4}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_1

    .line 125
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sIgnoreApks:Ljava/util/Set;

    const-string v1, "/system/app/FM.apk"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 126
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sIgnoreApks:Ljava/util/Set;

    const-string v1, "/system/app/FM"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 128
    :cond_1
    sget-boolean v0, Lcom/android/server/pm/PackageManagerServiceInjector;->IS_X7_LTE_ALL:Z

    if-eqz v0, :cond_2

    .line 129
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sIgnoreApks:Ljava/util/Set;

    const-string v1, "/system/app/VirtualSim.apk"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 130
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sIgnoreApks:Ljava/util/Set;

    const-string v1, "/system/app/VirtualSim"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 132
    :cond_2
    invoke-static {}, Lcom/android/server/pm/PackageManagerServiceInjector;->readIgnoreApks()V

    .line 135
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sIgnorePackages:Ljava/util/Set;

    const-string v1, "com.sogou.inputmethod.mi"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 137
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sSilentlyUninstallPackages:Ljava/util/Set;

    const-string v1, "com.miui.home"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 138
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sSilentlyUninstallPackages:Ljava/util/Set;

    const-string v1, "com.xiaomi.market"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 139
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sSilentlyUninstallPackages:Ljava/util/Set;

    const-string v1, "com.xiaomi.mipicks"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 140
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sSilentlyUninstallPackages:Ljava/util/Set;

    const-string v1, "com.xiaomi.discover"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 141
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sSilentlyUninstallPackages:Ljava/util/Set;

    const-string v1, "com.xiaomi.gamecenter"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 142
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sSilentlyUninstallPackages:Ljava/util/Set;

    const-string v1, "com.xiaomi.gamecenter.pad"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 148
    sget-boolean v0, Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z

    if-nez v0, :cond_3

    sget-boolean v0, Lmiui/os/Build;->IS_CM_CUSTOMIZATION:Z

    if-eqz v0, :cond_3

    const-string v0, "locked"

    const-string v1, "ro.secureboot.lockstate"

    invoke-static {v1}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 151
    :cond_3
    sget-boolean v0, Lmiui/os/Build;->IS_CM_CUSTOMIZATION_TEST:Z

    if-nez v0, :cond_4

    .line 152
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sIgnorePackages:Ljava/util/Set;

    const-string v1, "com.miui.dmregservice"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 413
    :cond_4
    new-array v0, v6, [[Ljava/lang/String;

    const/16 v1, 0x9

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "com.jeejen.home"

    aput-object v2, v1, v5

    const-string v2, "com.jeejen.contact"

    aput-object v2, v1, v4

    const-string v2, "com.jeejen.jjbox"

    aput-object v2, v1, v6

    const-string v2, "com.jeejen.helper"

    aput-object v2, v1, v7

    const-string v2, "com.jeejen.container.miui"

    aput-object v2, v1, v8

    const/4 v2, 0x5

    const-string v3, "com.jeejen.family.miui"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "com.jeejen.family.miui.mms"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string v3, "com.jeejen.store"

    aput-object v3, v1, v2

    const/16 v2, 0x8

    const-string v3, "com.jeejen.knowledge"

    aput-object v3, v1, v2

    aput-object v1, v0, v5

    new-array v1, v8, [Ljava/lang/String;

    const-string v2, "com.miui.home"

    aput-object v2, v1, v5

    const-string v2, "com.android.mms"

    aput-object v2, v1, v4

    const-string v2, "com.android.contacts"

    aput-object v2, v1, v6

    const-string v2, "com.android.launcher3"

    aput-object v2, v1, v7

    aput-object v1, v0, v4

    sput-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->BLOCK_APPS:[[Ljava/lang/String;

    .line 418
    const/4 v0, 0x0

    sput-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->msBlockAppMap:Ljava/util/Map;

    .line 812
    new-instance v0, Landroid/os/Handler;

    new-instance v1, Lcom/android/server/pm/PackageManagerServiceInjector$1;

    invoke-direct {v1}, Lcom/android/server/pm/PackageManagerServiceInjector$1;-><init>()V

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    sput-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->mHandler:Landroid/os/Handler;

    .line 856
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sXSpaceFriendlyActionList:Ljava/util/ArrayList;

    .line 859
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sXSpaceFriendlyActionList:Ljava/util/ArrayList;

    const-string v1, "com.sina.weibo.action.sdkidentity"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 860
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sXSpaceFriendlyActionList:Ljava/util/ArrayList;

    const-string v1, "com.sina.weibo.remotessoservice"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 877
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sCrossXSpaceIntent:Ljava/util/ArrayList;

    .line 879
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sCrossXSpaceIntent:Ljava/util/ArrayList;

    const-string v1, "android.intent.action.VIEW"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 880
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sCrossXSpaceIntent:Ljava/util/ArrayList;

    const-string v1, "android.intent.action.SEND"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 881
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sCrossXSpaceIntent:Ljava/util/ArrayList;

    const-string v1, "android.intent.action.DIAL"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 882
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sCrossXSpaceIntent:Ljava/util/ArrayList;

    const-string v1, "android.intent.action.GET_CONTENT"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 883
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sCrossXSpaceIntent:Ljava/util/ArrayList;

    const-string v1, "android.media.action.IMAGE_CAPTURE"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 896
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sNotDisable:Ljava/util/ArrayList;

    .line 899
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sNotDisable:Ljava/util/ArrayList;

    const-string v1, "com.lbe.security.miui"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 900
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sNotDisable:Ljava/util/ArrayList;

    const-string v1, "com.miui.securitycenter"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 901
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sNotDisable:Ljava/util/ArrayList;

    const-string v1, "com.android.updater"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 902
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sNotDisable:Ljava/util/ArrayList;

    const-string v1, "com.xiaomi.market"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 903
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sNotDisable:Ljava/util/ArrayList;

    const-string v1, "com.xiaomi.finddevice"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 904
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sNotDisable:Ljava/util/ArrayList;

    const-string v1, "com.miui.home"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 918
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sShellCheckPermissions:Ljava/util/ArrayList;

    .line 921
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sShellCheckPermissions:Ljava/util/ArrayList;

    const-string v1, "android.permission.SEND_SMS"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 922
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sShellCheckPermissions:Ljava/util/ArrayList;

    const-string v1, "android.permission.CALL_PHONE"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 923
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sShellCheckPermissions:Ljava/util/ArrayList;

    const-string v1, "android.permission.READ_CONTACTS"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 924
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sShellCheckPermissions:Ljava/util/ArrayList;

    const-string v1, "android.permission.WRITE_CONTACTS"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 925
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sShellCheckPermissions:Ljava/util/ArrayList;

    const-string v1, "android.permission.BACKUP"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 926
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sShellCheckPermissions:Ljava/util/ArrayList;

    const-string v1, "android.permission.CLEAR_APP_USER_DATA"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 927
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sShellCheckPermissions:Ljava/util/ArrayList;

    const-string v1, "android.permission.WRITE_SECURE_SETTINGS"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 928
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sShellCheckPermissions:Ljava/util/ArrayList;

    const-string v1, "android.permission.WRITE_SETTINGS"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 929
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sShellCheckPermissions:Ljava/util/ArrayList;

    const-string v1, "android.permission.MANAGE_DEVICE_ADMINS"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 930
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sShellCheckPermissions:Ljava/util/ArrayList;

    const-string v1, "android.permission.UPDATE_APP_OPS_STATS"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 931
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sShellCheckPermissions:Ljava/util/ArrayList;

    const-string v1, "android.permission.INJECT_EVENTS"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 932
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sShellCheckPermissions:Ljava/util/ArrayList;

    const-string v1, "android.permission.INSTALL_GRANT_RUNTIME_PERMISSIONS"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 933
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sShellCheckPermissions:Ljava/util/ArrayList;

    const-string v1, "android.permission.GRANT_RUNTIME_PERMISSIONS"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 934
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sShellCheckPermissions:Ljava/util/ArrayList;

    const-string v1, "android.permission.REVOKE_RUNTIME_PERMISSIONS"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 936
    const-string v0, "ro.debuggable"

    invoke-static {v0, v5}, Lmiui/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    if-ne v0, v4, :cond_6

    const-string v0, "ro.secureboot.devicelock"

    invoke-static {v0, v5}, Lmiui/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "unlocked"

    const-string v1, "ro.secureboot.lockstate"

    invoke-static {v1}, Lmiui/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 939
    :cond_5
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sShellCheckPermissions:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 967
    :cond_6
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sAllowPackage:Ljava/util/ArrayList;

    .line 970
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sAllowPackage:Ljava/util/ArrayList;

    const-string v1, "com.xiaomi.market"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 971
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sAllowPackage:Ljava/util/ArrayList;

    const-string v1, "com.android.vending"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 972
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sAllowPackage:Ljava/util/ArrayList;

    const-string v1, "com.xiaomi.gamecenter"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 973
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sAllowPackage:Ljava/util/ArrayList;

    const-string v1, "com.android.packageinstaller"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 974
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sAllowPackage:Ljava/util/ArrayList;

    const-string v1, "com.google.android.packageinstaller"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 975
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sAllowPackage:Ljava/util/ArrayList;

    const-string v1, "com.android.managedprovisioning"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 976
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sAllowPackage:Ljava/util/ArrayList;

    const-string v1, "com.miui.securitycenter"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 977
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sAllowPackage:Ljava/util/ArrayList;

    const-string v1, "com.miui.cloudbackup"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 978
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sAllowPackage:Ljava/util/ArrayList;

    const-string v1, "com.miui.analytics"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 979
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sAllowPackage:Ljava/util/ArrayList;

    const-string v1, "com.miui.video"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 980
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sAllowPackage:Ljava/util/ArrayList;

    const-string v1, "com.miui.player"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 981
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sAllowPackage:Ljava/util/ArrayList;

    const-string v1, "com.android.provision"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 982
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sAllowPackage:Ljava/util/ArrayList;

    const-string v1, "com.miui.powerkeeper"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 983
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sAllowPackage:Ljava/util/ArrayList;

    const-string v1, "com.miui.systemAdSolution"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 984
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sAllowPackage:Ljava/util/ArrayList;

    const-string v1, "com.miui.packageinstaller"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 985
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sAllowPackage:Ljava/util/ArrayList;

    const-string v1, "com.xiaomi.discover"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 986
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sAllowPackage:Ljava/util/ArrayList;

    const-string v1, "com.xiaomi.mipicks"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 987
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sAllowPackage:Ljava/util/ArrayList;

    const-string v1, "com.securespaces.android.ssm.service"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 988
    return-void
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 838
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .prologue
    .line 84
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static addIgnoreApk(Ljava/lang/String;)V
    .locals 1
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 229
    if-eqz p0, :cond_0

    .line 230
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sIgnoreApks:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 232
    :cond_0
    return-void
.end method

.method static addIgnorePackage(Ljava/lang/String;)V
    .locals 1
    .param p0, "packageName"    # Ljava/lang/String;

    .prologue
    .line 239
    if-eqz p0, :cond_0

    .line 240
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sIgnorePackages:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 242
    :cond_0
    return-void
.end method

.method static addLostPackagePropertyForOta(Landroid/content/Context;)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x2

    .line 775
    const-string v0, "com.google.android.setupwizard"

    .line 776
    .local v0, "SetupWizardPkg":Ljava/lang/String;
    sget-boolean v2, Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z

    if-eqz v2, :cond_0

    .line 778
    if-eqz p0, :cond_2

    .line 779
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 780
    .local v1, "pm":Landroid/content/pm/PackageManager;
    if-eqz v1, :cond_1

    .line 781
    invoke-virtual {v1, v0}, Landroid/content/pm/PackageManager;->getApplicationEnabledSetting(Ljava/lang/String;)I

    move-result v2

    if-eq v3, v2, :cond_0

    .line 782
    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/pm/PackageManager;->setApplicationEnabledSetting(Ljava/lang/String;II)V

    .line 793
    .end local v1    # "pm":Landroid/content/pm/PackageManager;
    :cond_0
    :goto_0
    return-void

    .line 785
    .restart local v1    # "pm":Landroid/content/pm/PackageManager;
    :cond_1
    sget-object v2, Lcom/android/server/pm/PackageManagerServiceInjector;->TAG:Ljava/lang/String;

    const-string v3, "pm Argument is null"

    invoke-static {v2, v3}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 790
    .end local v1    # "pm":Landroid/content/pm/PackageManager;
    :catch_0
    move-exception v2

    goto :goto_0

    .line 788
    :cond_2
    sget-object v2, Lcom/android/server/pm/PackageManagerServiceInjector;->TAG:Ljava/lang/String;

    const-string v3, "context Argument is null"

    invoke-static {v2, v3}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0
.end method

.method static addMiuiSharedUids(Lcom/android/server/pm/Settings;Z)V
    .locals 5
    .param p0, "settings"    # Lcom/android/server/pm/Settings;
    .param p1, "multipleUids"    # Z

    .prologue
    const/16 v1, 0x2710

    const/16 v4, 0x8

    const/4 v3, 0x1

    .line 253
    const-string v2, "android.uid.backup"

    if-eqz p1, :cond_1

    const/16 v0, 0x2648

    :goto_0
    invoke-virtual {p0, v2, v0, v3, v4}, Lcom/android/server/pm/Settings;->addSharedUserLPw(Ljava/lang/String;III)Lcom/android/server/pm/SharedUserSetting;

    .line 257
    const-string v2, "android.uid.theme"

    if-eqz p1, :cond_2

    const/16 v0, 0x2649

    :goto_1
    invoke-virtual {p0, v2, v0, v3, v4}, Lcom/android/server/pm/Settings;->addSharedUserLPw(Ljava/lang/String;III)Lcom/android/server/pm/SharedUserSetting;

    .line 261
    const-string v2, "android.uid.updater"

    if-eqz p1, :cond_3

    const/16 v0, 0x264a

    :goto_2
    invoke-virtual {p0, v2, v0, v3, v4}, Lcom/android/server/pm/Settings;->addSharedUserLPw(Ljava/lang/String;III)Lcom/android/server/pm/SharedUserSetting;

    .line 265
    const-string v0, "android.uid.finddevice"

    if-eqz p1, :cond_0

    const/16 v1, 0x2652

    :cond_0
    invoke-virtual {p0, v0, v1, v3, v4}, Lcom/android/server/pm/Settings;->addSharedUserLPw(Ljava/lang/String;III)Lcom/android/server/pm/SharedUserSetting;

    .line 269
    return-void

    :cond_1
    move v0, v1

    .line 253
    goto :goto_0

    :cond_2
    move v0, v1

    .line 257
    goto :goto_1

    :cond_3
    move v0, v1

    .line 261
    goto :goto_2
.end method

.method static addUpdateSystemApp(Lcom/android/server/pm/PackageSetting;)V
    .locals 2
    .param p0, "ps"    # Lcom/android/server/pm/PackageSetting;

    .prologue
    .line 1123
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->updateSystemPackages:Landroid/util/ArrayMap;

    iget-object v1, p0, Lcom/android/server/pm/PackageSetting;->name:Ljava/lang/String;

    invoke-virtual {v0, v1, p0}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1124
    return-void
.end method

.method static adjustCpuAbisForSharedUserLPw(Lcom/android/server/pm/PackageManagerService;Ljava/util/Set;Landroid/content/pm/PackageParser$Package;Z)V
    .locals 0
    .param p0, "pms"    # Lcom/android/server/pm/PackageManagerService;
    .param p2, "scannedPackage"    # Landroid/content/pm/PackageParser$Package;
    .param p3, "bootComplete"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/server/pm/PackageManagerService;",
            "Ljava/util/Set",
            "<",
            "Lcom/android/server/pm/PackageSetting;",
            ">;",
            "Landroid/content/pm/PackageParser$Package;",
            "Z)V"
        }
    .end annotation

    .prologue
    .line 497
    .local p1, "packagesForUser":Ljava/util/Set;, "Ljava/util/Set<Lcom/android/server/pm/PackageSetting;>;"
    invoke-static {p0, p1, p2, p3}, Lcom/android/server/pm/PackageManagerServiceInjectorProxy;->adjustCpuAbisForSharedUserLPw(Lcom/android/server/pm/PackageManagerService;Ljava/util/Set;Landroid/content/pm/PackageParser$Package;Z)V

    .line 498
    return-void
.end method

.method static adjustCpuAbisForSharedUserLPw(Lcom/android/server/pm/PackageManagerService;Ljava/util/Set;Landroid/content/pm/PackageParser$Package;ZZ)V
    .locals 0
    .param p0, "pms"    # Lcom/android/server/pm/PackageManagerService;
    .param p2, "scannedPackage"    # Landroid/content/pm/PackageParser$Package;
    .param p3, "forceDexOpt"    # Z
    .param p4, "deferDexOpt"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/server/pm/PackageManagerService;",
            "Ljava/util/Set",
            "<",
            "Lcom/android/server/pm/PackageSetting;",
            ">;",
            "Landroid/content/pm/PackageParser$Package;",
            "ZZ)V"
        }
    .end annotation

    .prologue
    .line 487
    .local p1, "packagesForUser":Ljava/util/Set;, "Ljava/util/Set<Lcom/android/server/pm/PackageSetting;>;"
    invoke-static {p0, p1, p2, p3, p4}, Lcom/android/server/pm/PackageManagerServiceInjectorProxy;->adjustCpuAbisForSharedUserLPw(Lcom/android/server/pm/PackageManagerService;Ljava/util/Set;Landroid/content/pm/PackageParser$Package;ZZ)V

    .line 488
    return-void
.end method

.method static adjustCpuAbisForSharedUserLPw(Lcom/android/server/pm/PackageManagerService;Ljava/util/Set;Landroid/content/pm/PackageParser$Package;ZZZ)V
    .locals 0
    .param p0, "pms"    # Lcom/android/server/pm/PackageManagerService;
    .param p2, "scannedPackage"    # Landroid/content/pm/PackageParser$Package;
    .param p3, "forceDexOpt"    # Z
    .param p4, "deferDexOpt"    # Z
    .param p5, "bootComplete"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/server/pm/PackageManagerService;",
            "Ljava/util/Set",
            "<",
            "Lcom/android/server/pm/PackageSetting;",
            ">;",
            "Landroid/content/pm/PackageParser$Package;",
            "ZZZ)V"
        }
    .end annotation

    .prologue
    .line 492
    .local p1, "packagesForUser":Ljava/util/Set;, "Ljava/util/Set<Lcom/android/server/pm/PackageSetting;>;"
    invoke-static/range {p0 .. p5}, Lcom/android/server/pm/PackageManagerServiceInjectorProxy;->adjustCpuAbisForSharedUserLPw(Lcom/android/server/pm/PackageManagerService;Ljava/util/Set;Landroid/content/pm/PackageParser$Package;ZZZ)V

    .line 493
    return-void
.end method

.method public static beforeSystemReady(Landroid/content/Context;)V
    .locals 0
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 1068
    invoke-static {p0}, Lcom/miui/server/SecSpaceManagerService;->init(Landroid/content/Context;)V

    .line 1069
    return-void
.end method

.method static checkAndResolveFlags(Landroid/content/Intent;Ljava/lang/String;II)I
    .locals 2
    .param p0, "intent"    # Landroid/content/Intent;
    .param p1, "resolvedType"    # Ljava/lang/String;
    .param p2, "flags"    # I
    .param p3, "userId"    # I

    .prologue
    .line 864
    if-eqz p0, :cond_0

    invoke-static {}, Lmiui/securityspace/XSpaceUserHandle;->isXSpaceUserCalling()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 865
    invoke-virtual {p0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 866
    .local v0, "action":Ljava/lang/String;
    sget-object v1, Lcom/android/server/pm/PackageManagerServiceInjector;->sXSpaceFriendlyActionList:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 867
    or-int/lit16 p2, p2, 0x2000

    .line 870
    .end local v0    # "action":Ljava/lang/String;
    :cond_0
    return p2
.end method

.method static checkAndRunPreInstallation(Landroid/os/Handler;Landroid/os/Message;)Z
    .locals 8
    .param p0, "h"    # Landroid/os/Handler;
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v4, 0x0

    .line 797
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Lcom/android/server/pm/PackageManagerService$InstallParams;

    .line 798
    .local v2, "param":Lcom/android/server/pm/PackageManagerService$InstallParams;
    invoke-static {v2}, Lcom/android/server/pm/PackageManagerServiceInjectorProxy;->getApkPathFromInstallParams(Lcom/android/server/pm/PackageManagerService$InstallParams;)Ljava/lang/String;

    move-result-object v0

    .line 799
    .local v0, "apkPath":Ljava/lang/String;
    invoke-static {}, Lcom/miui/whetstone/PowerKeeperPolicy;->getInstance()Lcom/miui/whetstone/PowerKeeperPolicy;

    move-result-object v3

    .line 800
    .local v3, "policy":Lcom/miui/whetstone/PowerKeeperPolicy;
    sget-object v5, Lcom/android/server/pm/PackageManagerServiceInjector;->TAG:Ljava/lang/String;

    const-string v6, "check if need preinstall apps"

    invoke-static {v5, v6}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 801
    invoke-virtual {v3, v0}, Lcom/miui/whetstone/PowerKeeperPolicy;->checkPreInstallNeeded(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 802
    sget-object v5, Lcom/android/server/pm/PackageManagerServiceInjector;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "pending installation for: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 803
    new-instance v1, Lcom/android/server/pm/PackageManagerServiceInjector$InstallAppParam;

    invoke-direct {v1, p0, p1}, Lcom/android/server/pm/PackageManagerServiceInjector$InstallAppParam;-><init>(Landroid/os/Handler;Landroid/os/Message;)V

    .line 804
    .local v1, "p":Lcom/android/server/pm/PackageManagerServiceInjector$InstallAppParam;
    sget-object v5, Lcom/android/server/pm/PackageManagerServiceInjector;->mHandler:Landroid/os/Handler;

    invoke-virtual {v3, v5, v4, v1}, Lcom/miui/whetstone/PowerKeeperPolicy;->registerForAppsPreInstalled(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 805
    invoke-virtual {v3}, Lcom/miui/whetstone/PowerKeeperPolicy;->preInstallApps()V

    .line 806
    const/4 v4, 0x1

    .line 808
    .end local v1    # "p":Lcom/android/server/pm/PackageManagerServiceInjector$InstallAppParam;
    :cond_0
    return v4
.end method

.method static checkApk(Landroid/content/Context;Landroid/os/Message;Z)Z
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "msg"    # Landroid/os/Message;
    .param p2, "systemReady"    # Z

    .prologue
    .line 472
    invoke-static {p0, p1, p2}, Lcom/android/server/pm/PackageManagerServiceInjectorProxy;->checkApk(Landroid/content/Context;Landroid/os/Message;Z)Z

    move-result v0

    return v0
.end method

.method static checkApkOnlySupport32BitForUserMode(Landroid/content/pm/PackageParser$Package;)V
    .locals 0
    .param p0, "pkg"    # Landroid/content/pm/PackageParser$Package;

    .prologue
    .line 477
    invoke-static {p0}, Lcom/android/server/pm/PackageManagerServiceInjectorProxy;->checkApkOnlySupport32BitForUserMode(Landroid/content/pm/PackageParser$Package;)V

    .line 479
    return-void
.end method

.method static checkGetInstalledAppsPermission(IILjava/lang/String;)Z
    .locals 7
    .param p0, "callingPid"    # I
    .param p1, "callingUid"    # I
    .param p2, "where"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    .line 1168
    sget-boolean v4, Lmiui/os/Build;->IS_CTS_BUILD:Z

    if-eqz v4, :cond_1

    .line 1197
    :cond_0
    :goto_0
    return v3

    .line 1172
    :cond_1
    sget-boolean v4, Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z

    if-nez v4, :cond_0

    .line 1176
    invoke-static {p1}, Landroid/os/UserHandle;->getAppId(I)I

    move-result v0

    .line 1177
    .local v0, "callingAppId":I
    const/16 v4, 0x2710

    if-lt v0, v4, :cond_0

    .line 1181
    invoke-static {p0}, Lcom/android/server/am/ExtraActivityManagerService;->getPackageNameByPid(I)Ljava/lang/String;

    move-result-object v1

    .line 1182
    .local v1, "callingPackage":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 1187
    :try_start_0
    sget-object v4, Lcom/android/server/pm/PackageManagerServiceInjector;->sAppOpsService:Lcom/android/internal/app/IAppOpsService;

    if-nez v4, :cond_2

    .line 1188
    const-string v4, "appops"

    invoke-static {v4}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v4

    invoke-static {v4}, Lcom/android/internal/app/IAppOpsService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/app/IAppOpsService;

    move-result-object v4

    sput-object v4, Lcom/android/server/pm/PackageManagerServiceInjector;->sAppOpsService:Lcom/android/internal/app/IAppOpsService;

    .line 1190
    :cond_2
    sget-object v4, Lcom/android/server/pm/PackageManagerServiceInjector;->sAppOpsService:Lcom/android/internal/app/IAppOpsService;

    const/16 v5, 0x2726

    invoke-interface {v4, v5, p1, v1}, Lcom/android/internal/app/IAppOpsService;->noteOperation(IILjava/lang/String;)I

    move-result v4

    if-eqz v4, :cond_0

    .line 1191
    sget-object v4, Lcom/android/server/pm/PackageManagerServiceInjector;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "MIUILOG- Permission Denied "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ". pkg : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " uid : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1192
    const/4 v3, 0x0

    goto :goto_0

    .line 1194
    :catch_0
    move-exception v2

    .line 1195
    .local v2, "e":Landroid/os/RemoteException;
    sget-object v4, Lcom/android/server/pm/PackageManagerServiceInjector;->TAG:Ljava/lang/String;

    const-string v5, "checkGetInstalledAppsPermission"

    invoke-static {v4, v5, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method static checkMiuiIntent(Lcom/android/server/pm/PackageManagerService;Landroid/content/Intent;Ljava/lang/String;ILjava/util/List;I)Landroid/content/pm/ResolveInfo;
    .locals 12
    .param p0, "pms"    # Lcom/android/server/pm/PackageManagerService;
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "resolvedType"    # Ljava/lang/String;
    .param p3, "flags"    # I
    .param p5, "userId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/server/pm/PackageManagerService;",
            "Landroid/content/Intent;",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/List",
            "<",
            "Landroid/content/pm/ResolveInfo;",
            ">;I)",
            "Landroid/content/pm/ResolveInfo;"
        }
    .end annotation

    .prologue
    .line 337
    .local p4, "query":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    if-eqz p1, :cond_c

    sget-boolean v1, Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z

    if-nez v1, :cond_c

    sget-boolean v1, Lmiui/os/Build;->IS_CTS_BUILD:Z

    if-nez v1, :cond_c

    .line 338
    invoke-virtual {p1}, Landroid/content/Intent;->getCategories()Ljava/util/Set;

    move-result-object v1

    if-eqz v1, :cond_3

    invoke-virtual {p1}, Landroid/content/Intent;->getCategories()Ljava/util/Set;

    move-result-object v1

    const-string v2, "android.intent.category.HOME"

    invoke-interface {v1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 339
    invoke-static {}, Lmiui/os/Build;->getUserMode()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_2

    .line 387
    :cond_0
    :goto_0
    invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v1

    if-eqz v1, :cond_c

    .line 388
    move/from16 v0, p5

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/android/server/pm/PackageManagerService;->resolveIntent(Landroid/content/Intent;Ljava/lang/String;II)Landroid/content/pm/ResolveInfo;

    move-result-object v10

    .line 392
    :cond_1
    :goto_1
    return-object v10

    .line 342
    :cond_2
    const-string v1, "com.miui.home"

    const-string v2, "com.miui.home.launcher.Launcher"

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0

    .line 344
    :cond_3
    const-string v1, "http"

    invoke-virtual {p1}, Landroid/content/Intent;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    const-string v1, "https"

    invoke-virtual {p1}, Landroid/content/Intent;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    :cond_4
    const-string v1, "android.intent.action.VIEW"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 346
    iget-object v1, p0, Lcom/android/server/pm/PackageManagerService;->mContext:Landroid/content/Context;

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    move-object/from16 v6, p4

    move/from16 v7, p5

    invoke-static/range {v1 .. v7}, Lmiui/util/UrlResolver;->checkMiuiIntent(Landroid/content/Context;Lcom/android/server/pm/PackageManagerService;Landroid/content/Intent;Ljava/lang/String;ILjava/util/List;I)Landroid/content/pm/ResolveInfo;

    move-result-object v10

    .line 348
    .local v10, "ri":Landroid/content/pm/ResolveInfo;
    if-nez v10, :cond_1

    .line 353
    invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v1

    if-nez v1, :cond_0

    invoke-virtual {p1}, Landroid/content/Intent;->getType()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    .line 354
    move-object/from16 v0, p4

    invoke-static {p0, v0}, Lcom/android/server/pm/PackageManagerServiceInjector;->getBrowserResolveInfo(Lcom/android/server/pm/PackageManagerService;Ljava/util/List;)Landroid/content/pm/ResolveInfo;

    move-result-object v10

    .line 355
    if-eqz v10, :cond_0

    goto :goto_1

    .line 359
    .end local v10    # "ri":Landroid/content/pm/ResolveInfo;
    :cond_5
    const-string v1, "mimarket"

    invoke-virtual {p1}, Landroid/content/Intent;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    const-string v1, "market"

    invoke-virtual {p1}, Landroid/content/Intent;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const-string v1, "android.intent.action.VIEW"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 362
    :cond_6
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v11

    .line 363
    .local v11, "uri":Landroid/net/Uri;
    if-eqz v11, :cond_0

    .line 364
    invoke-virtual {v11}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v8

    .line 365
    .local v8, "host":Ljava/lang/String;
    if-eqz v8, :cond_0

    const-string v1, "details"

    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    const-string v1, "search"

    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 366
    :cond_7
    invoke-static/range {p4 .. p4}, Lcom/android/server/pm/PackageManagerServiceInjector;->getMarketResolveInfo(Ljava/util/List;)Landroid/content/pm/ResolveInfo;

    move-result-object v10

    .line 367
    .restart local v10    # "ri":Landroid/content/pm/ResolveInfo;
    if-eqz v10, :cond_0

    goto/16 :goto_1

    .line 373
    .end local v8    # "host":Ljava/lang/String;
    .end local v10    # "ri":Landroid/content/pm/ResolveInfo;
    .end local v11    # "uri":Landroid/net/Uri;
    :cond_8
    const-string v1, "application/vnd.android.package-archive"

    invoke-virtual {p1}, Landroid/content/Intent;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "android.intent.action.VIEW"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 375
    sget-boolean v1, Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z

    if-nez v1, :cond_9

    sget-boolean v1, Lmiui/os/Build;->IS_CTS_BUILD:Z

    if-eqz v1, :cond_b

    .line 376
    :cond_9
    const-string v9, "com.google.android.packageinstaller"

    .line 377
    .local v9, "realPkgName":Ljava/lang/String;
    iget-object v2, p0, Lcom/android/server/pm/PackageManagerService;->mPackages:Landroid/util/ArrayMap;

    monitor-enter v2

    .line 378
    :try_start_0
    iget-object v1, p0, Lcom/android/server/pm/PackageManagerService;->mSettings:Lcom/android/server/pm/Settings;

    iget-object v1, v1, Lcom/android/server/pm/Settings;->mRenamedPackages:Landroid/util/ArrayMap;

    const-string v3, "com.google.android.packageinstaller"

    invoke-virtual {v1, v3}, Landroid/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 379
    iget-object v1, p0, Lcom/android/server/pm/PackageManagerService;->mSettings:Lcom/android/server/pm/Settings;

    iget-object v1, v1, Lcom/android/server/pm/Settings;->mRenamedPackages:Landroid/util/ArrayMap;

    const-string v3, "com.google.android.packageinstaller"

    invoke-virtual {v1, v3}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Ljava/lang/String;

    move-object v9, v0

    .line 381
    :cond_a
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 385
    :goto_2
    const-string v1, "com.android.packageinstaller.PackageInstallerActivity"

    invoke-virtual {p1, v9, v1}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto/16 :goto_0

    .line 381
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    .line 383
    .end local v9    # "realPkgName":Ljava/lang/String;
    :cond_b
    const-string v9, "com.miui.packageinstaller"

    .restart local v9    # "realPkgName":Ljava/lang/String;
    goto :goto_2

    .line 392
    .end local v9    # "realPkgName":Ljava/lang/String;
    :cond_c
    iget-object v10, p0, Lcom/android/server/pm/PackageManagerService;->mResolveInfo:Landroid/content/pm/ResolveInfo;

    goto/16 :goto_1
.end method

.method static checkMiuiSdk(Landroid/content/pm/PackageParser$Package;Lcom/android/server/pm/PackageManagerService;)Z
    .locals 1
    .param p0, "pkg"    # Landroid/content/pm/PackageParser$Package;
    .param p1, "pms"    # Lcom/android/server/pm/PackageManagerService;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 743
    invoke-static {p0, p1}, Lcom/android/server/pm/PackageManagerServiceInjectorProxy;->checkMiuiSdk(Landroid/content/pm/PackageParser$Package;Lcom/android/server/pm/PackageManagerService;)Z

    move-result v0

    return v0
.end method

.method static checkPackageForUserModeLPw(Lcom/android/server/pm/PackageSetting;)V
    .locals 15
    .param p0, "ps"    # Lcom/android/server/pm/PackageSetting;

    .prologue
    .line 421
    const-string v11, "support_oldman_mode"

    const/4 v12, 0x0

    invoke-static {v11, v12}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v11

    if-eqz v11, :cond_5

    .line 423
    sget-object v11, Lcom/android/server/pm/PackageManagerServiceInjector;->msBlockAppMap:Ljava/util/Map;

    if-nez v11, :cond_2

    .line 424
    sget-object v12, Lcom/android/server/pm/PackageManagerServiceInjector;->BLOCK_APPS:[[Ljava/lang/String;

    monitor-enter v12

    .line 425
    :try_start_0
    sget-object v11, Lcom/android/server/pm/PackageManagerServiceInjector;->msBlockAppMap:Ljava/util/Map;

    if-nez v11, :cond_1

    .line 426
    new-instance v11, Ljava/util/HashMap;

    invoke-direct {v11}, Ljava/util/HashMap;-><init>()V

    sput-object v11, Lcom/android/server/pm/PackageManagerServiceInjector;->msBlockAppMap:Ljava/util/Map;

    .line 427
    const/4 v7, 0x0

    .local v7, "mode":I
    :goto_0
    sget-object v11, Lcom/android/server/pm/PackageManagerServiceInjector;->BLOCK_APPS:[[Ljava/lang/String;

    array-length v11, v11

    if-ge v7, v11, :cond_1

    .line 428
    sget-object v11, Lcom/android/server/pm/PackageManagerServiceInjector;->BLOCK_APPS:[[Ljava/lang/String;

    aget-object v1, v11, v7

    .local v1, "arr$":[Ljava/lang/String;
    array-length v6, v1

    .local v6, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_1
    if-ge v4, v6, :cond_0

    aget-object v0, v1, v4

    .line 429
    .local v0, "app":Ljava/lang/String;
    sget-object v11, Lcom/android/server/pm/PackageManagerServiceInjector;->msBlockAppMap:Ljava/util/Map;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-interface {v11, v0, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 428
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 427
    .end local v0    # "app":Ljava/lang/String;
    :cond_0
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 433
    .end local v1    # "arr$":[Ljava/lang/String;
    .end local v4    # "i$":I
    .end local v6    # "len$":I
    .end local v7    # "mode":I
    :cond_1
    monitor-exit v12
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 437
    :cond_2
    sget-object v11, Lcom/android/server/pm/PackageManagerServiceInjector;->msBlockAppMap:Ljava/util/Map;

    iget-object v12, p0, Lcom/android/server/pm/PackageSetting;->name:Ljava/lang/String;

    invoke-interface {v11, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    .line 438
    .local v8, "modeInt":Ljava/lang/Integer;
    if-nez v8, :cond_3

    .line 439
    sget-object v11, Lcom/android/server/pm/PackageManagerServiceInjector;->msBlockAppMap:Ljava/util/Map;

    iget-object v12, p0, Lcom/android/server/pm/PackageSetting;->realName:Ljava/lang/String;

    invoke-interface {v11, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "modeInt":Ljava/lang/Integer;
    check-cast v8, Ljava/lang/Integer;

    .line 442
    .restart local v8    # "modeInt":Ljava/lang/Integer;
    :cond_3
    if-eqz v8, :cond_5

    .line 445
    const/4 v9, 0x0

    .line 446
    .local v9, "setInstalledMethod":Ljava/lang/reflect/Method;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    .local v2, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_2
    if-eqz v2, :cond_4

    .line 448
    :try_start_1
    const-string v11, "setInstalled"

    const/4 v12, 0x2

    new-array v12, v12, [Ljava/lang/Class;

    const/4 v13, 0x0

    sget-object v14, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v14, v12, v13

    const/4 v13, 0x1

    sget-object v14, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v14, v12, v13

    invoke-virtual {v2, v11, v12}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v9

    .line 449
    if-eqz v9, :cond_6

    .line 457
    :cond_4
    if-eqz v9, :cond_5

    .line 458
    invoke-static {}, Lmiui/os/Build;->getUserMode()I

    move-result v11

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v12

    if-eq v11, v12, :cond_7

    const/4 v5, 0x1

    .line 459
    .local v5, "inst":Z
    :goto_3
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v10

    .line 462
    .local v10, "userId":I
    const/4 v11, 0x2

    :try_start_2
    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v13

    aput-object v13, v11, v12

    const/4 v12, 0x1

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-virtual {v9, p0, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 469
    .end local v2    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v5    # "inst":Z
    .end local v8    # "modeInt":Ljava/lang/Integer;
    .end local v9    # "setInstalledMethod":Ljava/lang/reflect/Method;
    .end local v10    # "userId":I
    :cond_5
    :goto_4
    return-void

    .line 433
    :catchall_0
    move-exception v11

    :try_start_3
    monitor-exit v12
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v11

    .line 451
    .restart local v2    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v8    # "modeInt":Ljava/lang/Integer;
    .restart local v9    # "setInstalledMethod":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v11

    .line 446
    :cond_6
    invoke-virtual {v2}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v2

    goto :goto_2

    .line 458
    :cond_7
    const/4 v5, 0x0

    goto :goto_3

    .line 463
    .restart local v5    # "inst":Z
    .restart local v10    # "userId":I
    :catch_1
    move-exception v3

    .line 464
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_4
.end method

.method static checkUidPermissionForUserMode(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .param p0, "permName"    # Ljava/lang/String;
    .param p1, "nameForUid"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x1

    .line 708
    invoke-static {}, Lmiui/os/Build;->getUserMode()I

    move-result v1

    if-ne v1, v0, :cond_3

    .line 709
    const-string v1, "android.permission.CALL_EMERGENCY"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "android.permission.CALL_PRIVILEGED"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 711
    :cond_0
    const-string v1, "com.jeejen.contact"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 717
    :cond_1
    :goto_0
    return v0

    .line 713
    :cond_2
    const-string v1, "com.jeejen.family.miui"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 717
    :cond_3
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static cleanupUpdateFailedSystemPackage(Ljava/lang/String;Lcom/android/server/pm/PackageManagerService;)V
    .locals 2
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "pms"    # Lcom/android/server/pm/PackageManagerService;

    .prologue
    .line 1140
    sget-object v1, Lcom/android/server/pm/PackageManagerServiceInjector;->updateSystemPackages:Landroid/util/ArrayMap;

    invoke-virtual {v1, p0}, Landroid/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p1, Lcom/android/server/pm/PackageManagerService;->mSettings:Lcom/android/server/pm/Settings;

    invoke-virtual {v1, p0}, Lcom/android/server/pm/Settings;->isDisabledSystemPackageLPr(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1142
    sget-object v1, Lcom/android/server/pm/PackageManagerServiceInjector;->updateSystemPackages:Landroid/util/ArrayMap;

    invoke-virtual {v1, p0}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/pm/PackageSetting;

    .line 1143
    .local v0, "ps":Lcom/android/server/pm/PackageSetting;
    invoke-static {p1, v0}, Lcom/android/server/pm/PackageManagerServiceInjectorProxy;->cleanupUpdateFailedSystemPackage(Lcom/android/server/pm/PackageManagerService;Lcom/android/server/pm/PackageSetting;)V

    .line 1145
    .end local v0    # "ps":Lcom/android/server/pm/PackageSetting;
    :cond_0
    return-void
.end method

.method static clearUpdateSystemApps()V
    .locals 1

    .prologue
    .line 1148
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->updateSystemPackages:Landroid/util/ArrayMap;

    invoke-virtual {v0}, Landroid/util/ArrayMap;->clear()V

    .line 1149
    return-void
.end method

.method static copyOdexFileIfExists(Ljava/io/File;Ljava/io/File;)V
    .locals 0
    .param p0, "origin"    # Ljava/io/File;
    .param p1, "codeFile"    # Ljava/io/File;

    .prologue
    .line 734
    invoke-static {p0, p1}, Lcom/android/server/pm/PackageManagerProxy;->copyOdexFileIfExists(Ljava/io/File;Ljava/io/File;)V

    .line 735
    return-void
.end method

.method private static deleteContents(Ljava/io/File;)Z
    .locals 9
    .param p0, "dir"    # Ljava/io/File;

    .prologue
    .line 602
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    .line 603
    .local v2, "files":[Ljava/io/File;
    const/4 v5, 0x1

    .line 604
    .local v5, "success":Z
    if-eqz v2, :cond_2

    .line 605
    move-object v0, v2

    .local v0, "arr$":[Ljava/io/File;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_2

    aget-object v1, v0, v3

    .line 606
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 607
    invoke-static {v1}, Lcom/android/server/pm/PackageManagerServiceInjector;->deleteContents(Ljava/io/File;)Z

    move-result v6

    and-int/2addr v5, v6

    .line 609
    :cond_0
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    move-result v6

    if-nez v6, :cond_1

    .line 610
    sget-object v6, Lcom/android/server/pm/PackageManagerServiceInjector;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Failed to delete "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 611
    const/4 v5, 0x0

    .line 605
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 615
    .end local v0    # "arr$":[Ljava/io/File;
    .end local v1    # "file":Ljava/io/File;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    :cond_2
    return v5
.end method

.method private static deleteFileOrDirectory(Ljava/io/File;)V
    .locals 1
    .param p0, "f"    # Ljava/io/File;

    .prologue
    .line 619
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 620
    invoke-static {p0}, Lcom/android/server/pm/PackageManagerServiceInjector;->deleteContents(Ljava/io/File;)Z

    .line 622
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 623
    return-void
.end method

.method static doRenameApk(Ljava/io/File;Ljava/lang/String;I)V
    .locals 0
    .param p0, "codeFile"    # Ljava/io/File;
    .param p1, "originName"    # Ljava/lang/String;
    .param p2, "installFlags"    # I

    .prologue
    .line 738
    invoke-static {p0, p1, p2}, Lcom/android/server/pm/PackageManagerProxy;->doRenameApk(Ljava/io/File;Ljava/lang/String;I)V

    .line 739
    return-void
.end method

.method private static existsApkFileUnderDir(Ljava/io/File;)Z
    .locals 7
    .param p0, "dir"    # Ljava/io/File;

    .prologue
    .line 631
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .line 632
    .local v0, "apkStuff":[Ljava/io/File;
    if-eqz v0, :cond_1

    .line 633
    move-object v1, v0

    .local v1, "arr$":[Ljava/io/File;
    array-length v4, v1

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_1

    aget-object v2, v1, v3

    .line 634
    .local v2, "f":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v5

    const-string v6, ".apk"

    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 635
    const/4 v5, 0x1

    .line 639
    .end local v1    # "arr$":[Ljava/io/File;
    .end local v2    # "f":Ljava/io/File;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    :goto_1
    return v5

    .line 633
    .restart local v1    # "arr$":[Ljava/io/File;
    .restart local v2    # "f":Ljava/io/File;
    .restart local v3    # "i$":I
    .restart local v4    # "len$":I
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 639
    .end local v1    # "arr$":[Ljava/io/File;
    .end local v2    # "f":Ljava/io/File;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    :cond_1
    const/4 v5, 0x0

    goto :goto_1
.end method

.method static filterBackgroundDexOptApps(Lcom/android/server/pm/PackageManagerService;Ljava/util/Collection;)V
    .locals 0
    .param p0, "pms"    # Lcom/android/server/pm/PackageManagerService;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/server/pm/PackageManagerService;",
            "Ljava/util/Collection",
            "<",
            "Landroid/content/pm/PackageParser$Package;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 874
    .local p1, "pkgs":Ljava/util/Collection;, "Ljava/util/Collection<Landroid/content/pm/PackageParser$Package;>;"
    invoke-static {p0, p1}, Lcom/android/server/pm/PackageManagerServiceInjectorProxy;->filterBackgroundDexOptApps(Lcom/android/server/pm/PackageManagerService;Ljava/util/Collection;)V

    .line 875
    return-void
.end method

.method static getBrowserResolveInfo(Lcom/android/server/pm/PackageManagerService;Ljava/util/List;)Landroid/content/pm/ResolveInfo;
    .locals 5
    .param p0, "pms"    # Lcom/android/server/pm/PackageManagerService;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/server/pm/PackageManagerService;",
            "Ljava/util/List",
            "<",
            "Landroid/content/pm/ResolveInfo;",
            ">;)",
            "Landroid/content/pm/ResolveInfo;"
        }
    .end annotation

    .prologue
    .line 299
    .local p1, "riList":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    const-string v3, "CN"

    invoke-static {v3}, Lmiui/os/Build;->checkRegion(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 300
    const/4 v1, 0x0

    .line 314
    :cond_0
    :goto_0
    return-object v1

    .line 302
    :cond_1
    invoke-static {p0, p1}, Lcom/android/server/pm/PackageManagerServiceInjector;->getSystemResolveInfo(Lcom/android/server/pm/PackageManagerService;Ljava/util/List;)Landroid/content/pm/ResolveInfo;

    move-result-object v1

    .line 305
    .local v1, "ret":Landroid/content/pm/ResolveInfo;
    if-nez v1, :cond_0

    .line 306
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/pm/ResolveInfo;

    .line 307
    .local v2, "ri":Landroid/content/pm/ResolveInfo;
    const-string v3, "com.android.browser"

    iget-object v4, v2, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v4, v4, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-boolean v3, v2, Landroid/content/pm/ResolveInfo;->system:Z

    if-nez v3, :cond_2

    .line 309
    move-object v1, v2

    .line 310
    goto :goto_0
.end method

.method static getInstalledApplicationsWithoutPermission(ILjava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 4
    .param p0, "callingUid"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/pm/ApplicationInfo;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/pm/ApplicationInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1201
    .local p1, "infos":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/pm/ApplicationInfo;>;"
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-nez v3, :cond_1

    .line 1212
    :cond_0
    return-object p1

    .line 1205
    :cond_1
    invoke-static {p0}, Landroid/os/UserHandle;->getAppId(I)I

    move-result v2

    .line 1206
    .local v2, "uid":I
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v0, v3, -0x1

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_0

    .line 1207
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/ApplicationInfo;

    .line 1208
    .local v1, "info":Landroid/content/pm/ApplicationInfo;
    iget v3, v1, Landroid/content/pm/ApplicationInfo;->uid:I

    if-eq v3, v2, :cond_2

    iget v3, v1, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v3, v3, 0x1

    if-nez v3, :cond_2

    .line 1209
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1206
    :cond_2
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method

.method static getInstalledPackagesWithoutPermission(ILjava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 4
    .param p0, "callingUid"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/pm/PackageInfo;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/pm/PackageInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1216
    .local p1, "infos":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/pm/PackageInfo;>;"
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-nez v3, :cond_1

    .line 1227
    :cond_0
    return-object p1

    .line 1220
    :cond_1
    invoke-static {p0}, Landroid/os/UserHandle;->getAppId(I)I

    move-result v2

    .line 1221
    .local v2, "uid":I
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v0, v3, -0x1

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_0

    .line 1222
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/pm/PackageInfo;

    iget-object v1, v3, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 1223
    .local v1, "info":Landroid/content/pm/ApplicationInfo;
    iget v3, v1, Landroid/content/pm/ApplicationInfo;->uid:I

    if-eq v3, v2, :cond_2

    iget v3, v1, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v3, v3, 0x1

    if-nez v3, :cond_2

    .line 1224
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1221
    :cond_2
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method

.method static getInstallerPackageName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "packageName"    # Ljava/lang/String;
    .param p1, "installerPackageName"    # Ljava/lang/String;

    .prologue
    .line 406
    const-string v0, "adb"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    if-eqz p0, :cond_0

    const-string v0, "com.android.cts."

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 407
    const/4 p1, 0x0

    .line 409
    .end local p1    # "installerPackageName":Ljava/lang/String;
    :cond_0
    return-object p1
.end method

.method static getMarketResolveInfo(Ljava/util/List;)Landroid/content/pm/ResolveInfo;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/content/pm/ResolveInfo;",
            ">;)",
            "Landroid/content/pm/ResolveInfo;"
        }
    .end annotation

    .prologue
    .line 322
    .local p0, "riList":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    const/4 v1, 0x0

    .line 323
    .local v1, "ret":Landroid/content/pm/ResolveInfo;
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/pm/ResolveInfo;

    .line 324
    .local v2, "ri":Landroid/content/pm/ResolveInfo;
    const-string v3, "com.xiaomi.market"

    iget-object v4, v2, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v4, v4, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-boolean v3, v2, Landroid/content/pm/ResolveInfo;->system:Z

    if-eqz v3, :cond_0

    .line 325
    move-object v1, v2

    .line 329
    .end local v2    # "ri":Landroid/content/pm/ResolveInfo;
    :cond_1
    return-object v1
.end method

.method private static getPackageName(Ljava/io/File;)Ljava/lang/String;
    .locals 2
    .param p0, "file"    # Ljava/io/File;

    .prologue
    .line 597
    invoke-static {p0}, Lcom/android/server/pm/PackageManagerProxy;->parsePackageLite(Ljava/io/File;)Landroid/content/pm/PackageParser$PackageLite;

    move-result-object v0

    .line 598
    .local v0, "pkg":Landroid/content/pm/PackageParser$PackageLite;
    if-eqz v0, :cond_0

    iget-object v1, v0, Landroid/content/pm/PackageParser$PackageLite;->packageName:Ljava/lang/String;

    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method static getSystemPackageFilePath(Ljava/lang/String;Lcom/android/server/pm/PackageManagerService;)Ljava/io/File;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "pms"    # Lcom/android/server/pm/PackageManagerService;

    .prologue
    .line 1131
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->updateSystemPackages:Landroid/util/ArrayMap;

    invoke-virtual {v0, p0}, Landroid/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/android/server/pm/PackageManagerService;->mSettings:Lcom/android/server/pm/Settings;

    invoke-virtual {v0, p0}, Lcom/android/server/pm/Settings;->isDisabledSystemPackageLPr(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1133
    iget-object v0, p1, Lcom/android/server/pm/PackageManagerService;->mSettings:Lcom/android/server/pm/Settings;

    invoke-virtual {v0, p0}, Lcom/android/server/pm/Settings;->getDisabledSystemPkgLPr(Ljava/lang/String;)Lcom/android/server/pm/PackageSetting;

    move-result-object v0

    iget-object v0, v0, Lcom/android/server/pm/PackageSetting;->codePath:Ljava/io/File;

    .line 1136
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static getSystemResolveInfo(Lcom/android/server/pm/PackageManagerService;Ljava/util/List;)Landroid/content/pm/ResolveInfo;
    .locals 8
    .param p0, "pms"    # Lcom/android/server/pm/PackageManagerService;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/server/pm/PackageManagerService;",
            "Ljava/util/List",
            "<",
            "Landroid/content/pm/ResolveInfo;",
            ">;)",
            "Landroid/content/pm/ResolveInfo;"
        }
    .end annotation

    .prologue
    .local p1, "riList":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    const/4 v7, 0x0

    .line 272
    const/4 v3, 0x0

    .line 273
    .local v3, "ret":Landroid/content/pm/ResolveInfo;
    invoke-interface {p1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/pm/ResolveInfo;

    iget v1, v5, Landroid/content/pm/ResolveInfo;->match:I

    .line 274
    .local v1, "match":I
    iget-object v5, p0, Lcom/android/server/pm/PackageManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 275
    .local v2, "pm":Landroid/content/pm/PackageManager;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/pm/ResolveInfo;

    .line 276
    .local v4, "ri":Landroid/content/pm/ResolveInfo;
    iget v6, v4, Landroid/content/pm/ResolveInfo;->priority:I

    invoke-interface {p1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/pm/ResolveInfo;

    iget v5, v5, Landroid/content/pm/ResolveInfo;->priority:I

    if-ge v6, v5, :cond_2

    .line 295
    .end local v4    # "ri":Landroid/content/pm/ResolveInfo;
    :cond_1
    return-object v3

    .line 280
    .restart local v4    # "ri":Landroid/content/pm/ResolveInfo;
    :cond_2
    iget v5, v4, Landroid/content/pm/ResolveInfo;->match:I

    if-le v5, v1, :cond_4

    .line 281
    iget v1, v4, Landroid/content/pm/ResolveInfo;->match:I

    .line 282
    const/4 v3, 0x0

    .line 291
    :cond_3
    iget-boolean v5, v4, Landroid/content/pm/ResolveInfo;->system:Z

    if-eqz v5, :cond_0

    iget-object v5, v4, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v5, v5, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-static {v2, v5}, Lmiui/content/pm/ExtraPackageManager;->isMiuiSystemApp(Landroid/content/pm/PackageManager;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 292
    move-object v3, v4

    goto :goto_0

    .line 283
    :cond_4
    iget v5, v4, Landroid/content/pm/ResolveInfo;->match:I

    if-lt v5, v1, :cond_0

    .line 286
    if-eqz v3, :cond_3

    goto :goto_0
.end method

.method static ignoreApk(Ljava/lang/String;)Z
    .locals 1
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 235
    if-eqz p0, :cond_0

    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sIgnoreApks:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static ignorePackage(Ljava/lang/String;)Z
    .locals 1
    .param p0, "packageName"    # Ljava/lang/String;

    .prologue
    .line 245
    if-eqz p0, :cond_0

    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sIgnorePackages:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static initExtraGuard(Landroid/content/Context;)V
    .locals 0
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 482
    invoke-static {p0}, Lmiui/provider/ExtraGuard;->init(Landroid/content/Context;)V

    .line 483
    return-void
.end method

.method static initTempInitApk(Z)V
    .locals 4
    .param p0, "isFirstBoot"    # Z

    .prologue
    .line 695
    invoke-static {p0}, Landroid/content/pm/PackageHideManager;->getInstance(Z)Landroid/content/pm/PackageHideManager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/pm/PackageHideManager;->getIgnoreApkPathList()Ljava/util/List;

    move-result-object v1

    .line 696
    .local v1, "ignorePathList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v1, :cond_0

    .line 697
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 698
    .local v2, "path":Ljava/lang/String;
    invoke-static {v2}, Lcom/android/server/pm/PackageManagerServiceInjector;->addIgnoreApk(Ljava/lang/String;)V

    goto :goto_0

    .line 701
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v2    # "path":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method static isAllowedDisable(Ljava/lang/String;I)Z
    .locals 2
    .param p0, "packageName"    # Ljava/lang/String;
    .param p1, "newState"    # I

    .prologue
    const/4 v0, 0x1

    .line 908
    if-eqz p1, :cond_0

    if-ne p1, v0, :cond_1

    .line 911
    :cond_0
    :goto_0
    return v0

    :cond_1
    sget-object v1, Lcom/android/server/pm/PackageManagerServiceInjector;->sNotDisable:Ljava/util/ArrayList;

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method static isAllowedHideApp(Lcom/android/server/pm/PackageManagerService;Ljava/lang/String;ZI)Z
    .locals 5
    .param p0, "service"    # Lcom/android/server/pm/PackageManagerService;
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "hidden"    # Z
    .param p3, "userId"    # I

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 955
    invoke-virtual {p0, p1, v2, p3}, Lcom/android/server/pm/PackageManagerService;->getApplicationInfo(Ljava/lang/String;II)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 956
    .local v0, "info":Landroid/content/pm/ApplicationInfo;
    if-nez v0, :cond_3

    move v1, v2

    .line 957
    .local v1, "isSystem":Z
    :goto_0
    const-string v4, "com.android.browser"

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    const-string v4, "com.android.chrome"

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 958
    :cond_0
    const/4 v1, 0x0

    .line 960
    :cond_1
    if-eqz p2, :cond_5

    if-nez v1, :cond_2

    sget-boolean v4, Lmiui/os/Build;->IS_CTS_BUILD:Z

    if-nez v4, :cond_5

    .line 961
    :cond_2
    sget-object v3, Lcom/android/server/pm/PackageManagerServiceInjector;->TAG:Ljava/lang/String;

    const-string v4, "MIUILOG- Not Support"

    invoke-static {v3, v4}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 964
    :goto_1
    return v2

    .line 956
    .end local v1    # "isSystem":Z
    :cond_3
    iget v4, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v4, v4, 0x1

    if-eqz v4, :cond_4

    move v1, v3

    goto :goto_0

    :cond_4
    move v1, v2

    goto :goto_0

    .restart local v1    # "isSystem":Z
    :cond_5
    move v2, v3

    .line 964
    goto :goto_1
.end method

.method static isAllowedInstall(I)Z
    .locals 1
    .param p0, "callingUid"    # I

    .prologue
    .line 991
    const/4 v0, 0x1

    return v0
.end method

.method public static isAllowedInstall(Landroid/content/Context;Ljava/io/File;ILjava/lang/String;)Z
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "originPath"    # Ljava/io/File;
    .param p2, "callingUid"    # I
    .param p3, "packageName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/server/pm/PackageManagerException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    .line 1004
    if-nez p1, :cond_0

    .line 1007
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v1, p2, p3, v2, v0}, Lcom/android/server/pm/PackageManagerServiceInjector;->isAllowedInstall(Ljava/lang/String;ILjava/lang/String;Landroid/content/pm/IPackageInstallObserver2;Z)Z

    move-result v0

    goto :goto_0
.end method

.method static isAllowedInstall(Landroid/content/Context;Ljava/lang/String;ILandroid/content/pm/IPackageInstallObserver2;)Z
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "originPath"    # Ljava/lang/String;
    .param p2, "callingUid"    # I
    .param p3, "observer"    # Landroid/content/pm/IPackageInstallObserver2;

    .prologue
    .line 996
    const/4 v0, 0x0

    const/4 v1, 0x0

    :try_start_0
    invoke-static {p1, p2, v0, p3, v1}, Lcom/android/server/pm/PackageManagerServiceInjector;->isAllowedInstall(Ljava/lang/String;ILjava/lang/String;Landroid/content/pm/IPackageInstallObserver2;Z)Z
    :try_end_0
    .catch Lcom/android/server/pm/PackageManagerException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 1000
    :goto_0
    return v0

    .line 997
    :catch_0
    move-exception v0

    .line 1000
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static isAllowedInstall(Ljava/lang/String;ILjava/lang/String;Landroid/content/pm/IPackageInstallObserver2;Z)Z
    .locals 10
    .param p0, "originPath"    # Ljava/lang/String;
    .param p1, "callingUid"    # I
    .param p2, "packageName"    # Ljava/lang/String;
    .param p3, "observer"    # Landroid/content/pm/IPackageInstallObserver2;
    .param p4, "session"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/server/pm/PackageManagerException;
        }
    .end annotation

    .prologue
    const/16 v9, 0x7d0

    const/4 v4, 0x0

    const/16 v8, -0x6f

    const/4 v5, 0x1

    .line 1012
    move-object v2, p2

    .line 1013
    .local v2, "pkg":Ljava/lang/String;
    if-ne p1, v9, :cond_1

    .line 1014
    const/4 v3, -0x1

    .line 1016
    .local v3, "result":I
    :try_start_0
    invoke-static {p0}, Lcom/android/commands/pm/PmInjector;->installVerify(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 1020
    :goto_0
    const/4 v6, 0x2

    if-eq v3, v6, :cond_1

    .line 1021
    sget-object v5, Lcom/android/server/pm/PackageManagerServiceInjector;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "MIUILOG- INSTALL_FAILED_USER_RESTRICTED  uid: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " pkg : "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1022
    invoke-static {v3}, Lcom/android/commands/pm/PmInjector;->statusToString(I)Ljava/lang/String;

    move-result-object v1

    .line 1023
    .local v1, "msg":Ljava/lang/String;
    if-nez p4, :cond_0

    if-eqz p3, :cond_0

    .line 1025
    :try_start_1
    const-string v5, ""

    const/16 v6, -0x6f

    const/4 v7, 0x0

    invoke-interface {p3, v5, v6, v1, v7}, Landroid/content/pm/IPackageInstallObserver2;->onPackageInstalled(Ljava/lang/String;ILjava/lang/String;Landroid/os/Bundle;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 1029
    :cond_0
    :goto_1
    if-eqz p4, :cond_3

    .line 1030
    new-instance v4, Lcom/android/server/pm/PackageManagerException;

    invoke-direct {v4, v8, v1}, Lcom/android/server/pm/PackageManagerException;-><init>(ILjava/lang/String;)V

    throw v4

    .line 1017
    .end local v1    # "msg":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 1018
    .local v0, "e":Ljava/lang/Throwable;
    sget-object v6, Lcom/android/server/pm/PackageManagerServiceInjector;->TAG:Ljava/lang/String;

    const-string v7, "Error"

    invoke-static {v6, v7, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 1036
    .end local v0    # "e":Ljava/lang/Throwable;
    .end local v3    # "result":I
    :cond_1
    if-eq p1, v9, :cond_2

    if-eqz p1, :cond_2

    sget-boolean v6, Lmiui/os/Build;->IS_CTS_BUILD:Z

    if-eqz v6, :cond_4

    :cond_2
    move v4, v5

    .line 1051
    :cond_3
    :goto_2
    return v4

    .line 1040
    :cond_4
    if-nez p4, :cond_5

    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v6

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v7

    if-ne v6, v7, :cond_5

    move v4, v5

    .line 1041
    goto :goto_2

    .line 1044
    :cond_5
    if-nez p4, :cond_6

    .line 1045
    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v6

    invoke-static {v6}, Lcom/android/server/am/ExtraActivityManagerService;->getPackageNameByPid(I)Ljava/lang/String;

    move-result-object v2

    .line 1047
    :cond_6
    sget-object v6, Lcom/android/server/pm/PackageManagerServiceInjector;->sAllowPackage:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7

    move v4, v5

    .line 1048
    goto :goto_2

    .line 1050
    :cond_7
    sget-object v5, Lcom/android/server/pm/PackageManagerServiceInjector;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "MIUILOG- Install Reject uid: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " pkg : "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 1026
    .restart local v1    # "msg":Ljava/lang/String;
    .restart local v3    # "result":I
    :catch_1
    move-exception v5

    goto :goto_1
.end method

.method static isCallerAllowedToSilentlyUninstall(ILcom/android/server/pm/PackageManagerService;)Z
    .locals 6
    .param p0, "callingUid"    # I
    .param p1, "pms"    # Lcom/android/server/pm/PackageManagerService;

    .prologue
    .line 1152
    invoke-virtual {p1, p0}, Lcom/android/server/pm/PackageManagerService;->getPackagesForUid(I)[Ljava/lang/String;

    move-result-object v2

    .line 1153
    .local v2, "pkgs":[Ljava/lang/String;
    iget-object v4, p1, Lcom/android/server/pm/PackageManagerService;->mPackages:Landroid/util/ArrayMap;

    monitor-enter v4

    .line 1154
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    :try_start_0
    array-length v3, v2

    if-ge v0, v3, :cond_1

    .line 1155
    sget-object v3, Lcom/android/server/pm/PackageManagerServiceInjector;->sSilentlyUninstallPackages:Ljava/util/Set;

    aget-object v5, v2, v0

    invoke-interface {v3, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1156
    iget-object v3, p1, Lcom/android/server/pm/PackageManagerService;->mPackages:Landroid/util/ArrayMap;

    aget-object v5, v2, v0

    invoke-virtual {v3, v5}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/PackageParser$Package;

    .line 1157
    .local v1, "pkg":Landroid/content/pm/PackageParser$Package;
    if-eqz v1, :cond_0

    invoke-static {p0}, Landroid/os/UserHandle;->getAppId(I)I

    move-result v3

    iget-object v5, v1, Landroid/content/pm/PackageParser$Package;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v5, v5, Landroid/content/pm/ApplicationInfo;->uid:I

    if-ne v3, v5, :cond_0

    .line 1158
    const/4 v3, 0x1

    monitor-exit v4

    .line 1164
    .end local v1    # "pkg":Landroid/content/pm/PackageParser$Package;
    :goto_1
    return v3

    .line 1154
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1162
    :cond_1
    monitor-exit v4

    .line 1164
    const/4 v3, 0x0

    goto :goto_1

    .line 1162
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3
.end method

.method private static isPackageInstalled(Lcom/android/server/pm/Settings;Ljava/lang/String;)Z
    .locals 2
    .param p0, "settings"    # Lcom/android/server/pm/Settings;
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 626
    iget-object v1, p0, Lcom/android/server/pm/Settings;->mPackages:Landroid/util/ArrayMap;

    invoke-virtual {v1, p1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/pm/PackageSetting;

    .line 627
    .local v0, "ps":Lcom/android/server/pm/PackageSetting;
    if-eqz v0, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method static isSecuritySpace(Lcom/android/server/pm/UserManagerService;I)Z
    .locals 3
    .param p0, "um"    # Lcom/android/server/pm/UserManagerService;
    .param p1, "userId"    # I

    .prologue
    .line 1072
    invoke-static {p0, p1}, Lcom/miui/server/SecSpaceManagerService;->isSecuritySpace(Lcom/android/server/pm/UserManagerService;I)Z

    move-result v0

    .line 1073
    .local v0, "isSecritySpace":Z
    if-eqz v0, :cond_0

    .line 1074
    sget-object v1, Lcom/android/server/pm/PackageManagerServiceInjector;->TAG:Ljava/lang/String;

    const-string v2, "Won\'t migrate app data for SecuritySpace"

    invoke-static {v1, v2}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1076
    :cond_0
    return v0
.end method

.method static isSystemPackage(Landroid/content/pm/PackageParser$Package;)Z
    .locals 1
    .param p0, "pkg"    # Landroid/content/pm/PackageParser$Package;

    .prologue
    .line 747
    iget-object v0, p0, Landroid/content/pm/PackageParser$Package;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static isTrueSystemPackage(Lcom/android/server/pm/PackageManagerService;Landroid/content/pm/PackageParser$Package;Ljava/lang/String;)Z
    .locals 5
    .param p0, "pms"    # Lcom/android/server/pm/PackageManagerService;
    .param p1, "pkg"    # Landroid/content/pm/PackageParser$Package;
    .param p2, "codePath"    # Ljava/lang/String;

    .prologue
    .line 758
    const/4 v1, 0x0

    .line 759
    .local v1, "ret":Z
    invoke-static {p1}, Lcom/android/server/pm/PackageManagerServiceInjector;->isSystemPackage(Landroid/content/pm/PackageParser$Package;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 760
    iget-object v3, p0, Lcom/android/server/pm/PackageManagerService;->mPackages:Landroid/util/ArrayMap;

    monitor-enter v3

    .line 761
    :try_start_0
    iget-object v2, p0, Lcom/android/server/pm/PackageManagerService;->mSettings:Lcom/android/server/pm/Settings;

    iget-object v4, p1, Landroid/content/pm/PackageParser$Package;->packageName:Ljava/lang/String;

    invoke-virtual {v2, v4}, Lcom/android/server/pm/Settings;->getDisabledSystemPkgLPr(Ljava/lang/String;)Lcom/android/server/pm/PackageSetting;

    move-result-object v0

    .line 762
    .local v0, "ps":Lcom/android/server/pm/PackageSetting;
    if-nez v0, :cond_2

    .line 763
    const/4 v1, 0x1

    .line 767
    :goto_0
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 769
    .end local v0    # "ps":Lcom/android/server/pm/PackageSetting;
    :cond_0
    sget-object v2, Landroid/os/Build;->TYPE:Ljava/lang/String;

    const-string v3, "user"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 770
    sget-object v3, Lcom/android/server/pm/PackageManagerServiceInjector;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ""

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " is "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    if-eqz v1, :cond_3

    const-string v2, ""

    :goto_1
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " a true system package"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 772
    :cond_1
    return v1

    .line 765
    .restart local v0    # "ps":Lcom/android/server/pm/PackageSetting;
    :cond_2
    :try_start_1
    iget-object v2, v0, Lcom/android/server/pm/PackageSetting;->codePathString:Ljava/lang/String;

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_0

    .line 767
    .end local v0    # "ps":Lcom/android/server/pm/PackageSetting;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 770
    :cond_3
    const-string v2, "not"

    goto :goto_1
.end method

.method static isUpdateSystemApp(Ljava/lang/String;)Z
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 1127
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->updateSystemPackages:Landroid/util/ArrayMap;

    invoke-virtual {v0, p0}, Landroid/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method static logComponentStateChanged(Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;)V
    .locals 4
    .param p0, "packageName"    # Ljava/lang/String;
    .param p1, "className"    # Ljava/lang/String;
    .param p2, "newState"    # I
    .param p3, "callingUid"    # I
    .param p4, "callingPid"    # I
    .param p5, "callingPackage"    # Ljava/lang/String;

    .prologue
    .line 1056
    sget-boolean v0, Lcom/android/server/pm/PackageManagerServiceInjector;->DEBUG_CHANGE:Z

    if-eqz v0, :cond_0

    .line 1057
    sget-object v1, Lcom/android/server/pm/PackageManagerServiceInjector;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "component state changed."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    if-eqz p0, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " package: "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    if-eqz p1, :cond_2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " class: "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_1
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " new state : "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " calling uid: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " calling pid: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    if-eqz p5, :cond_3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " calling package: "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_2
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1065
    :cond_0
    return-void

    .line 1057
    :cond_1
    const-string v0, ""

    goto :goto_0

    :cond_2
    const-string v0, ""

    goto :goto_1

    :cond_3
    const-string v0, ""

    goto :goto_2
.end method

.method public static onPackageDeleted(Ljava/lang/String;I)V
    .locals 1
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "retCode"    # I

    .prologue
    .line 1104
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/android/server/pm/PackageManagerServiceInjector;->onPackageDeleted(Ljava/lang/String;ILjava/lang/String;)V

    .line 1105
    return-void
.end method

.method public static onPackageDeleted(Ljava/lang/String;ILjava/lang/String;)V
    .locals 4
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "retCode"    # I
    .param p2, "retMsg"    # Ljava/lang/String;

    .prologue
    .line 1108
    const/4 v1, 0x1

    if-ne p1, v1, :cond_0

    .line 1120
    .end local p2    # "retMsg":Ljava/lang/String;
    :goto_0
    return-void

    .line 1111
    .restart local p2    # "retMsg":Ljava/lang/String;
    :cond_0
    new-instance v0, Lmiui/mqsas/sdk/event/PackageEvent;

    invoke-direct {v0}, Lmiui/mqsas/sdk/event/PackageEvent;-><init>()V

    .line 1112
    .local v0, "event":Lmiui/mqsas/sdk/event/PackageEvent;
    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Lmiui/mqsas/sdk/event/PackageEvent;->setType(I)V

    .line 1113
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lmiui/mqsas/sdk/event/PackageEvent;->setTimeStamp(J)V

    .line 1114
    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lmiui/mqsas/sdk/event/PackageEvent;->setAction(I)V

    .line 1115
    invoke-virtual {v0, p0}, Lmiui/mqsas/sdk/event/PackageEvent;->setPackageName(Ljava/lang/String;)V

    .line 1116
    invoke-virtual {v0, p1}, Lmiui/mqsas/sdk/event/PackageEvent;->setReturnCode(I)V

    .line 1117
    if-eqz p2, :cond_1

    .end local p2    # "retMsg":Ljava/lang/String;
    :goto_1
    invoke-virtual {v0, p2}, Lmiui/mqsas/sdk/event/PackageEvent;->setReturnMsg(Ljava/lang/String;)V

    .line 1118
    sget-object v1, Lcom/android/server/pm/PackageManagerServiceInjector;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "MIUILOG-onPackageDeleted: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1119
    invoke-static {}, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->getInstance()Lmiui/mqsas/sdk/MQSEventManagerDelegate;

    move-result-object v1

    invoke-virtual {v1, v0}, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->reportPackageEvent(Lmiui/mqsas/sdk/event/PackageEvent;)V

    goto :goto_0

    .line 1117
    .restart local p2    # "retMsg":Ljava/lang/String;
    :cond_1
    const-string p2, ""

    goto :goto_1
.end method

.method public static onPackageInstalled(Ljava/lang/String;ILjava/lang/String;ZLandroid/content/pm/PackageParser$Package;Ljava/lang/String;)V
    .locals 4
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "retCode"    # I
    .param p2, "retMsg"    # Ljava/lang/String;
    .param p3, "update"    # Z
    .param p4, "pkg"    # Landroid/content/pm/PackageParser$Package;
    .param p5, "installerPkgName"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    .line 1086
    if-ne p1, v1, :cond_0

    .line 1101
    .end local p2    # "retMsg":Ljava/lang/String;
    .end local p5    # "installerPkgName":Ljava/lang/String;
    :goto_0
    return-void

    .line 1089
    .restart local p2    # "retMsg":Ljava/lang/String;
    .restart local p5    # "installerPkgName":Ljava/lang/String;
    :cond_0
    new-instance v0, Lmiui/mqsas/sdk/event/PackageEvent;

    invoke-direct {v0}, Lmiui/mqsas/sdk/event/PackageEvent;-><init>()V

    .line 1090
    .local v0, "event":Lmiui/mqsas/sdk/event/PackageEvent;
    const/16 v2, 0x20

    invoke-virtual {v0, v2}, Lmiui/mqsas/sdk/event/PackageEvent;->setType(I)V

    .line 1091
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lmiui/mqsas/sdk/event/PackageEvent;->setTimeStamp(J)V

    .line 1092
    if-eqz p3, :cond_1

    const/4 v1, 0x3

    :cond_1
    invoke-virtual {v0, v1}, Lmiui/mqsas/sdk/event/PackageEvent;->setAction(I)V

    .line 1093
    invoke-virtual {v0, p0}, Lmiui/mqsas/sdk/event/PackageEvent;->setPackageName(Ljava/lang/String;)V

    .line 1094
    invoke-virtual {v0, p1}, Lmiui/mqsas/sdk/event/PackageEvent;->setReturnCode(I)V

    .line 1095
    if-eqz p2, :cond_2

    .end local p2    # "retMsg":Ljava/lang/String;
    :goto_1
    invoke-virtual {v0, p2}, Lmiui/mqsas/sdk/event/PackageEvent;->setReturnMsg(Ljava/lang/String;)V

    .line 1096
    if-eqz p4, :cond_3

    iget v1, p4, Landroid/content/pm/PackageParser$Package;->mVersionCode:I

    :goto_2
    invoke-virtual {v0, v1}, Lmiui/mqsas/sdk/event/PackageEvent;->setVersionCode(I)V

    .line 1097
    if-eqz p4, :cond_4

    iget-object v1, p4, Landroid/content/pm/PackageParser$Package;->mVersionName:Ljava/lang/String;

    :goto_3
    invoke-virtual {v0, v1}, Lmiui/mqsas/sdk/event/PackageEvent;->setVersionName(Ljava/lang/String;)V

    .line 1098
    if-eqz p5, :cond_5

    .end local p5    # "installerPkgName":Ljava/lang/String;
    :goto_4
    invoke-virtual {v0, p5}, Lmiui/mqsas/sdk/event/PackageEvent;->setInstallerPkgName(Ljava/lang/String;)V

    .line 1099
    sget-object v1, Lcom/android/server/pm/PackageManagerServiceInjector;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "MIUILOG-onPackageInstalled: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1100
    invoke-static {}, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->getInstance()Lmiui/mqsas/sdk/MQSEventManagerDelegate;

    move-result-object v1

    invoke-virtual {v1, v0}, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->reportPackageEvent(Lmiui/mqsas/sdk/event/PackageEvent;)V

    goto :goto_0

    .line 1095
    .restart local p2    # "retMsg":Ljava/lang/String;
    .restart local p5    # "installerPkgName":Ljava/lang/String;
    :cond_2
    const-string p2, ""

    goto :goto_1

    .line 1096
    .end local p2    # "retMsg":Ljava/lang/String;
    :cond_3
    const/4 v1, 0x0

    goto :goto_2

    .line 1097
    :cond_4
    const-string v1, ""

    goto :goto_3

    .line 1098
    :cond_5
    const-string p5, ""

    goto :goto_4
.end method

.method public static onPackageInstalled(Ljava/lang/String;IZLandroid/content/pm/PackageParser$Package;Ljava/lang/String;)V
    .locals 6
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "retCode"    # I
    .param p2, "update"    # Z
    .param p3, "pkg"    # Landroid/content/pm/PackageParser$Package;
    .param p4, "installerPkgName"    # Ljava/lang/String;

    .prologue
    .line 1081
    const/4 v2, 0x0

    move-object v0, p0

    move v1, p1

    move v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-static/range {v0 .. v5}, Lcom/android/server/pm/PackageManagerServiceInjector;->onPackageInstalled(Ljava/lang/String;ILjava/lang/String;ZLandroid/content/pm/PackageParser$Package;Ljava/lang/String;)V

    .line 1082
    return-void
.end method

.method static performPreinstallApp(Lcom/android/server/pm/PackageManagerService;Lcom/android/server/pm/Settings;)V
    .locals 7
    .param p0, "pms"    # Lcom/android/server/pm/PackageManagerService;
    .param p1, "curPkgSettings"    # Lcom/android/server/pm/Settings;

    .prologue
    const/4 v5, 0x0

    .line 501
    invoke-static {p0, p1}, Lcom/android/server/pm/PreinstallApp;->copyPreinstallApps(Lcom/android/server/pm/PackageManagerService;Lcom/android/server/pm/Settings;)V

    .line 503
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x17

    if-lt v4, v6, :cond_2

    sget-boolean v4, Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z

    if-nez v4, :cond_2

    .line 504
    iget-object v4, p1, Lcom/android/server/pm/Settings;->mPackages:Landroid/util/ArrayMap;

    const-string v6, "com.miui.packageinstaller"

    invoke-virtual {v4, v6}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/server/pm/PackageSetting;

    .line 505
    .local v3, "miuiInstaller":Lcom/android/server/pm/PackageSetting;
    iget-object v4, p1, Lcom/android/server/pm/Settings;->mPackages:Landroid/util/ArrayMap;

    const-string v6, "com.google.android.packageinstaller"

    invoke-virtual {v4, v6}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/pm/PackageSetting;

    .line 506
    .local v1, "googleInstaller":Lcom/android/server/pm/PackageSetting;
    iget-object v4, p1, Lcom/android/server/pm/Settings;->mPackages:Landroid/util/ArrayMap;

    const-string v6, "com.android.packageinstaller"

    invoke-virtual {v4, v6}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/pm/PackageSetting;

    .line 507
    .local v0, "androidInstaller":Lcom/android/server/pm/PackageSetting;
    sget-boolean v2, Lmiui/os/Build;->IS_CTS_BUILD:Z

    .line 508
    .local v2, "isCtsBuild":Z
    if-eqz v3, :cond_0

    .line 509
    if-nez v2, :cond_3

    const/4 v4, 0x1

    :goto_0
    invoke-virtual {v3, v4, v5}, Lcom/android/server/pm/PackageSetting;->setInstalled(ZI)V

    .line 511
    :cond_0
    if-eqz v1, :cond_1

    .line 512
    invoke-virtual {v1, v2, v5}, Lcom/android/server/pm/PackageSetting;->setInstalled(ZI)V

    .line 514
    :cond_1
    if-eqz v0, :cond_2

    .line 515
    invoke-virtual {v0, v2, v5}, Lcom/android/server/pm/PackageSetting;->setInstalled(ZI)V

    .line 518
    .end local v0    # "androidInstaller":Lcom/android/server/pm/PackageSetting;
    .end local v1    # "googleInstaller":Lcom/android/server/pm/PackageSetting;
    .end local v2    # "isCtsBuild":Z
    .end local v3    # "miuiInstaller":Lcom/android/server/pm/PackageSetting;
    :cond_2
    return-void

    .restart local v0    # "androidInstaller":Lcom/android/server/pm/PackageSetting;
    .restart local v1    # "googleInstaller":Lcom/android/server/pm/PackageSetting;
    .restart local v2    # "isCtsBuild":Z
    .restart local v3    # "miuiInstaller":Lcom/android/server/pm/PackageSetting;
    :cond_3
    move v4, v5

    .line 509
    goto :goto_0
.end method

.method static preCheckUidPermission(Ljava/lang/String;I)I
    .locals 3
    .param p0, "permName"    # Ljava/lang/String;
    .param p1, "uid"    # I

    .prologue
    .line 945
    const/16 v0, 0x7d0

    if-ne p1, v0, :cond_0

    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sShellCheckPermissions:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "persist.security.adbinput"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 947
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MIUILOG- permission\u3000denied "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 948
    const/4 v0, -0x1

    .line 950
    :goto_0
    return v0

    :cond_0
    const/16 v0, -0x64

    goto :goto_0
.end method

.method static protectAppFromDeleting(Lcom/android/server/pm/PackageManagerService;Ljava/lang/String;Ljava/lang/Object;)Z
    .locals 12
    .param p0, "pms"    # Lcom/android/server/pm/PackageManagerService;
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "observer"    # Ljava/lang/Object;

    .prologue
    const/4 v9, 0x1

    const/4 v10, 0x0

    .line 529
    const/4 v7, 0x0

    .line 530
    .local v7, "p":Landroid/content/pm/PackageParser$Package;
    iget-object v11, p0, Lcom/android/server/pm/PackageManagerService;->mPackages:Landroid/util/ArrayMap;

    monitor-enter v11

    .line 531
    :try_start_0
    iget-object v8, p0, Lcom/android/server/pm/PackageManagerService;->mPackages:Landroid/util/ArrayMap;

    invoke-virtual {v8, p1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    move-object v0, v8

    check-cast v0, Landroid/content/pm/PackageParser$Package;

    move-object v7, v0

    .line 532
    monitor-exit v11
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 534
    if-eqz v7, :cond_0

    iget-object v8, v7, Landroid/content/pm/PackageParser$Package;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    if-nez v8, :cond_1

    :cond_0
    move v8, v10

    .line 593
    :goto_0
    return v8

    .line 532
    :catchall_0
    move-exception v8

    :try_start_1
    monitor-exit v11
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v8

    .line 538
    :cond_1
    iget-object v8, v7, Landroid/content/pm/PackageParser$Package;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v8, v8, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit16 v8, v8, 0x80

    if-eqz v8, :cond_6

    iget-object v8, v7, Landroid/content/pm/PackageParser$Package;->mAppMetaData:Landroid/os/Bundle;

    if-eqz v8, :cond_6

    iget-object v8, v7, Landroid/content/pm/PackageParser$Package;->mAppMetaData:Landroid/os/Bundle;

    const-string v11, "com.miui.sdk.module"

    invoke-virtual {v8, v11}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 541
    iget-object v8, p0, Lcom/android/server/pm/PackageManagerService;->mContext:Landroid/content/Context;

    const-string v11, "keyguard"

    invoke-virtual {v8, v11}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/app/KeyguardManager;

    .line 543
    .local v5, "km":Landroid/app/KeyguardManager;
    invoke-virtual {v5}, Landroid/app/KeyguardManager;->inKeyguardRestrictedInputMode()Z

    move-result v8

    if-eqz v8, :cond_2

    .line 545
    const/16 v8, -0x3e8

    :try_start_2
    invoke-static {p2, p1, v8}, Lcom/android/server/pm/PackageManagerServiceInjectorProxy;->returnPackageDeletedResultToObserver(Ljava/lang/Object;Ljava/lang/String;I)V
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_0

    move v8, v9

    .line 552
    goto :goto_0

    .line 548
    :catch_0
    move-exception v3

    .line 549
    .local v3, "e1":Landroid/os/RemoteException;
    invoke-virtual {v3}, Landroid/os/RemoteException;->printStackTrace()V

    move v8, v10

    .line 550
    goto :goto_0

    .line 556
    .end local v3    # "e1":Landroid/os/RemoteException;
    :cond_2
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v1

    .line 557
    .local v1, "am":Landroid/app/IActivityManager;
    new-instance v6, Lcom/android/server/pm/PackageManagerServiceInjector$PackageDeleteConfirmObserver;

    invoke-direct {v6}, Lcom/android/server/pm/PackageManagerServiceInjector$PackageDeleteConfirmObserver;-><init>()V

    .line 558
    .local v6, "obs":Lcom/android/server/pm/PackageManagerServiceInjector$PackageDeleteConfirmObserver;
    new-instance v4, Landroid/content/Intent;

    const-string v8, "com.miui.action.PACKAGE_DELETE_CONFIRM"

    invoke-direct {v4, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 559
    .local v4, "intent":Landroid/content/Intent;
    const-string v8, "android.intent.category.DEFAULT"

    invoke-virtual {v4, v8}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 560
    const-string v8, "extra_pkgname"

    invoke-virtual {v4, v8, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 561
    const-string v8, "observer"

    invoke-virtual {v4, v8, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/IBinder;)Landroid/content/Intent;

    .line 562
    const/high16 v8, 0x10000000

    invoke-virtual {v4, v8}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 565
    :try_start_3
    const-string v8, "pm"

    invoke-static {v1, v8, v4}, Lcom/android/server/pm/PackageManagerServiceInjectorProxy;->startActivity(Landroid/app/IActivityManager;Ljava/lang/String;Landroid/content/Intent;)I

    move-result v8

    if-eqz v8, :cond_3

    move v8, v10

    .line 567
    goto :goto_0

    .line 569
    :cond_3
    monitor-enter v6
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_2

    .line 570
    :goto_1
    :try_start_4
    iget-boolean v8, v6, Lcom/android/server/pm/PackageManagerServiceInjector$PackageDeleteConfirmObserver;->finished:Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    if-nez v8, :cond_4

    .line 572
    :try_start_5
    invoke-virtual {v6}, Ljava/lang/Object;->wait()V
    :try_end_5
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_1

    .line 573
    :catch_1
    move-exception v2

    .line 574
    .local v2, "e":Ljava/lang/InterruptedException;
    :try_start_6
    invoke-virtual {v2}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 575
    monitor-exit v6

    move v8, v10

    goto :goto_0

    .line 578
    .end local v2    # "e":Ljava/lang/InterruptedException;
    :cond_4
    iget-boolean v8, v6, Lcom/android/server/pm/PackageManagerServiceInjector$PackageDeleteConfirmObserver;->delete:Z

    if-nez v8, :cond_5

    .line 580
    const/16 v8, -0x3e8

    invoke-static {p2, p1, v8}, Lcom/android/server/pm/PackageManagerServiceInjectorProxy;->returnPackageDeletedResultToObserver(Ljava/lang/Object;Ljava/lang/String;I)V

    .line 584
    monitor-exit v6

    move v8, v9

    goto :goto_0

    .line 586
    :cond_5
    monitor-exit v6

    .end local v1    # "am":Landroid/app/IActivityManager;
    .end local v4    # "intent":Landroid/content/Intent;
    .end local v5    # "km":Landroid/app/KeyguardManager;
    .end local v6    # "obs":Lcom/android/server/pm/PackageManagerServiceInjector$PackageDeleteConfirmObserver;
    :cond_6
    move v8, v10

    .line 593
    goto/16 :goto_0

    .line 586
    .restart local v1    # "am":Landroid/app/IActivityManager;
    .restart local v4    # "intent":Landroid/content/Intent;
    .restart local v5    # "km":Landroid/app/KeyguardManager;
    .restart local v6    # "obs":Lcom/android/server/pm/PackageManagerServiceInjector$PackageDeleteConfirmObserver;
    :catchall_1
    move-exception v8

    monitor-exit v6
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :try_start_7
    throw v8
    :try_end_7
    .catch Landroid/os/RemoteException; {:try_start_7 .. :try_end_7} :catch_2

    .line 587
    :catch_2
    move-exception v3

    .line 588
    .restart local v3    # "e1":Landroid/os/RemoteException;
    invoke-virtual {v3}, Landroid/os/RemoteException;->printStackTrace()V

    move v8, v10

    .line 589
    goto/16 :goto_0
.end method

.method private static readIgnoreApks()V
    .locals 15

    .prologue
    .line 158
    invoke-static {}, Lmiui/os/Build;->getCustVariant()Ljava/lang/String;

    move-result-object v1

    .line 159
    .local v1, "custVariant":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-eqz v13, :cond_1

    .line 226
    :cond_0
    :goto_0
    return-void

    .line 162
    :cond_1
    const/4 v5, 0x0

    .line 164
    .local v5, "inputStream":Ljava/io/InputStream;
    :try_start_0
    new-instance v6, Ljava/io/FileInputStream;

    new-instance v13, Ljava/io/File;

    const-string v14, "/system/etc/install_app_filter.xml"

    invoke-direct {v13, v14}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v6, v13}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_7
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_6
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 165
    .end local v5    # "inputStream":Ljava/io/InputStream;
    .local v6, "inputStream":Ljava/io/InputStream;
    :try_start_1
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v3

    .line 166
    .local v3, "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    invoke-virtual {v3}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v9

    .line 167
    .local v9, "parser":Lorg/xmlpull/v1/XmlPullParser;
    const-string v13, "UTF-8"

    invoke-interface {v9, v6, v13}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 168
    const/4 v11, 0x0

    .line 169
    .local v11, "tagName":Ljava/lang/String;
    const/4 v0, 0x0

    .line 170
    .local v0, "appPath":Ljava/lang/String;
    const/4 v7, 0x0

    .line 171
    .local v7, "is_add_apps":Z
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v12

    .line 172
    .local v12, "type":I
    :goto_1
    const/4 v13, 0x1

    if-eq v13, v12, :cond_c

    .line 173
    packed-switch v12, :pswitch_data_0

    .line 212
    :cond_2
    :goto_2
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v12

    goto :goto_1

    .line 175
    :pswitch_0
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    .line 176
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v13

    if-lez v13, :cond_3

    .line 177
    const/4 v13, 0x0

    invoke-interface {v9, v13}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v0

    .line 179
    :cond_3
    const-string v13, "add_apps"

    invoke-virtual {v13, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_4

    .line 180
    const/4 v7, 0x1

    goto :goto_2

    .line 181
    :cond_4
    const-string v13, "ignore_apps"

    invoke-virtual {v13, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_5

    .line 182
    const/4 v7, 0x0

    goto :goto_2

    .line 183
    :cond_5
    const-string v13, "app"

    invoke-virtual {v13, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_2

    .line 184
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v13

    const-string v14, " "

    invoke-virtual {v13, v14}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v10

    .line 185
    .local v10, "ss":[Ljava/lang/String;
    const/4 v8, 0x0

    .line 186
    .local v8, "is_current_cust":Z
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_3
    array-length v13, v10

    if-ge v4, v13, :cond_6

    .line 187
    aget-object v13, v10, v4

    invoke-virtual {v13, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_9

    .line 188
    const/4 v8, 0x1

    .line 192
    :cond_6
    if-eqz v7, :cond_7

    if-eqz v8, :cond_8

    :cond_7
    if-nez v7, :cond_a

    if-eqz v8, :cond_a

    .line 193
    :cond_8
    sget-object v13, Lcom/android/server/pm/PackageManagerServiceInjector;->sIgnoreApks:Ljava/util/Set;

    invoke-interface {v13, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_2

    .line 215
    .end local v0    # "appPath":Ljava/lang/String;
    .end local v3    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v4    # "i":I
    .end local v7    # "is_add_apps":Z
    .end local v8    # "is_current_cust":Z
    .end local v9    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v10    # "ss":[Ljava/lang/String;
    .end local v11    # "tagName":Ljava/lang/String;
    .end local v12    # "type":I
    :catch_0
    move-exception v13

    move-object v5, v6

    .line 218
    .end local v6    # "inputStream":Ljava/io/InputStream;
    .restart local v5    # "inputStream":Ljava/io/InputStream;
    :goto_4
    if-eqz v5, :cond_0

    .line 220
    :try_start_2
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    goto/16 :goto_0

    .line 221
    :catch_1
    move-exception v13

    goto/16 :goto_0

    .line 186
    .end local v5    # "inputStream":Ljava/io/InputStream;
    .restart local v0    # "appPath":Ljava/lang/String;
    .restart local v3    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .restart local v4    # "i":I
    .restart local v6    # "inputStream":Ljava/io/InputStream;
    .restart local v7    # "is_add_apps":Z
    .restart local v8    # "is_current_cust":Z
    .restart local v9    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v10    # "ss":[Ljava/lang/String;
    .restart local v11    # "tagName":Ljava/lang/String;
    .restart local v12    # "type":I
    :cond_9
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 194
    :cond_a
    if-eqz v7, :cond_2

    if-eqz v8, :cond_2

    .line 195
    :try_start_3
    sget-object v13, Lcom/android/server/pm/PackageManagerServiceInjector;->sIgnoreApks:Ljava/util/Set;

    invoke-interface {v13, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_2

    .line 196
    sget-object v13, Lcom/android/server/pm/PackageManagerServiceInjector;->sIgnoreApks:Ljava/util/Set;

    invoke-interface {v13, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_2

    .line 216
    .end local v0    # "appPath":Ljava/lang/String;
    .end local v3    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v4    # "i":I
    .end local v7    # "is_add_apps":Z
    .end local v8    # "is_current_cust":Z
    .end local v9    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v10    # "ss":[Ljava/lang/String;
    .end local v11    # "tagName":Ljava/lang/String;
    .end local v12    # "type":I
    :catch_2
    move-exception v13

    move-object v5, v6

    .line 218
    .end local v6    # "inputStream":Ljava/io/InputStream;
    .restart local v5    # "inputStream":Ljava/io/InputStream;
    :goto_5
    if-eqz v5, :cond_0

    .line 220
    :try_start_4
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    goto/16 :goto_0

    .line 221
    :catch_3
    move-exception v13

    goto/16 :goto_0

    .line 202
    .end local v5    # "inputStream":Ljava/io/InputStream;
    .restart local v0    # "appPath":Ljava/lang/String;
    .restart local v3    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .restart local v6    # "inputStream":Ljava/io/InputStream;
    .restart local v7    # "is_add_apps":Z
    .restart local v9    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v11    # "tagName":Ljava/lang/String;
    .restart local v12    # "type":I
    :pswitch_1
    :try_start_5
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v2

    .line 203
    .local v2, "end_tag_name":Ljava/lang/String;
    const-string v13, "add_apps"

    invoke-virtual {v13, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_b

    .line 204
    const/4 v7, 0x0

    goto/16 :goto_2

    .line 205
    :cond_b
    const-string v13, "ignore_apps"

    invoke-virtual {v13, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    move-result v13

    if-eqz v13, :cond_2

    .line 206
    const/4 v7, 0x1

    goto/16 :goto_2

    .line 218
    .end local v2    # "end_tag_name":Ljava/lang/String;
    :cond_c
    if-eqz v6, :cond_e

    .line 220
    :try_start_6
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    move-object v5, v6

    .line 223
    .end local v6    # "inputStream":Ljava/io/InputStream;
    .restart local v5    # "inputStream":Ljava/io/InputStream;
    goto/16 :goto_0

    .line 221
    .end local v5    # "inputStream":Ljava/io/InputStream;
    .restart local v6    # "inputStream":Ljava/io/InputStream;
    :catch_4
    move-exception v13

    move-object v5, v6

    .line 223
    .end local v6    # "inputStream":Ljava/io/InputStream;
    .restart local v5    # "inputStream":Ljava/io/InputStream;
    goto/16 :goto_0

    .line 218
    .end local v0    # "appPath":Ljava/lang/String;
    .end local v3    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v7    # "is_add_apps":Z
    .end local v9    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v11    # "tagName":Ljava/lang/String;
    .end local v12    # "type":I
    :catchall_0
    move-exception v13

    :goto_6
    if-eqz v5, :cond_d

    .line 220
    :try_start_7
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_5

    .line 223
    :cond_d
    :goto_7
    throw v13

    .line 221
    :catch_5
    move-exception v14

    goto :goto_7

    .line 218
    .end local v5    # "inputStream":Ljava/io/InputStream;
    .restart local v6    # "inputStream":Ljava/io/InputStream;
    :catchall_1
    move-exception v13

    move-object v5, v6

    .end local v6    # "inputStream":Ljava/io/InputStream;
    .restart local v5    # "inputStream":Ljava/io/InputStream;
    goto :goto_6

    .line 216
    :catch_6
    move-exception v13

    goto :goto_5

    .line 215
    :catch_7
    move-exception v13

    goto :goto_4

    .end local v5    # "inputStream":Ljava/io/InputStream;
    .restart local v0    # "appPath":Ljava/lang/String;
    .restart local v3    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .restart local v6    # "inputStream":Ljava/io/InputStream;
    .restart local v7    # "is_add_apps":Z
    .restart local v9    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v11    # "tagName":Ljava/lang/String;
    .restart local v12    # "type":I
    :cond_e
    move-object v5, v6

    .end local v6    # "inputStream":Ljava/io/InputStream;
    .restart local v5    # "inputStream":Ljava/io/InputStream;
    goto/16 :goto_0

    .line 173
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method static removePackageFromSharedUser(Lcom/android/server/pm/PackageSetting;)V
    .locals 1
    .param p0, "ps"    # Lcom/android/server/pm/PackageSetting;

    .prologue
    .line 521
    iget-object v0, p0, Lcom/android/server/pm/PackageSetting;->sharedUser:Lcom/android/server/pm/SharedUserSetting;

    if-eqz v0, :cond_0

    .line 522
    iget-object v0, p0, Lcom/android/server/pm/PackageSetting;->sharedUser:Lcom/android/server/pm/SharedUserSetting;

    invoke-virtual {v0, p0}, Lcom/android/server/pm/SharedUserSetting;->removePackage(Lcom/android/server/pm/PackageSetting;)V

    .line 524
    :cond_0
    return-void
.end method

.method static resolveUserId(Landroid/content/Intent;Ljava/lang/String;I)I
    .locals 2
    .param p0, "intent"    # Landroid/content/Intent;
    .param p1, "resolvedType"    # Ljava/lang/String;
    .param p2, "userId"    # I

    .prologue
    .line 888
    invoke-static {p2}, Lmiui/securityspace/XSpaceUserHandle;->isXSpaceUserId(I)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/android/server/pm/PackageManagerServiceInjector;->sCrossXSpaceIntent:Ljava/util/ArrayList;

    invoke-virtual {p0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 891
    const/4 p2, 0x0

    .line 893
    .end local p2    # "userId":I
    :cond_0
    return p2
.end method

.method static setExtraRestoreconFlag()V
    .locals 0

    .prologue
    .line 915
    invoke-static {}, Lcom/android/server/pm/ExtraPackageManagerService;->setExtraRestoreconFlag()V

    .line 916
    return-void
.end method

.method private static shouldDeletePackage(Ljava/util/Set;Lcom/android/server/pm/Settings;Ljava/io/File;)Z
    .locals 4
    .param p1, "settings"    # Lcom/android/server/pm/Settings;
    .param p2, "apk"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/android/server/pm/Settings;",
            "Ljava/io/File;",
            ")Z"
        }
    .end annotation

    .prologue
    .local p0, "keepedFilePaths":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .line 644
    invoke-virtual {p2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 668
    :cond_0
    :goto_0
    return v1

    .line 648
    :cond_1
    invoke-virtual {p2}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 650
    invoke-static {p2}, Lcom/android/server/pm/PackageManagerServiceInjector;->existsApkFileUnderDir(Ljava/io/File;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 653
    invoke-virtual {p2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    const-string v2, ".+-[0-9]+$"

    invoke-virtual {v1, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    goto :goto_0

    .line 657
    :cond_2
    invoke-virtual {p2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    const-string v3, ".apk"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 667
    :cond_3
    invoke-static {p2}, Lcom/android/server/pm/PackageManagerServiceInjector;->getPackageName(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    .line 668
    .local v0, "packageName":Ljava/lang/String;
    if-eqz v0, :cond_4

    invoke-static {p1, v0}, Lcom/android/server/pm/PackageManagerServiceInjector;->isPackageInstalled(Lcom/android/server/pm/Settings;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    :cond_4
    const/4 v1, 0x1

    goto :goto_0
.end method

.method static tryDeleteInvalidOrDuplicatePackages(Lcom/android/server/pm/PackageManagerService;Lcom/android/server/pm/Settings;)V
    .locals 11
    .param p0, "pms"    # Lcom/android/server/pm/PackageManagerService;
    .param p1, "settings"    # Lcom/android/server/pm/Settings;

    .prologue
    .line 672
    invoke-virtual {p0}, Lcom/android/server/pm/PackageManagerService;->isFirstBoot()Z

    move-result v8

    if-nez v8, :cond_2

    .line 674
    new-instance v6, Ljava/util/HashSet;

    invoke-direct {v6}, Ljava/util/HashSet;-><init>()V

    .line 676
    .local v6, "keepedFilePaths":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    iget-object v8, p1, Lcom/android/server/pm/Settings;->mPackages:Landroid/util/ArrayMap;

    invoke-virtual {v8}, Landroid/util/ArrayMap;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 677
    .local v4, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/android/server/pm/PackageSetting;>;"
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/android/server/pm/PackageSetting;

    iget-object v8, v8, Lcom/android/server/pm/PackageSetting;->codePathString:Ljava/lang/String;

    invoke-interface {v6, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 680
    .end local v4    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/android/server/pm/PackageSetting;>;"
    :cond_0
    new-instance v2, Ljava/io/File;

    const-string v8, "/data/app"

    invoke-direct {v2, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 681
    .local v2, "appDir":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 682
    .local v1, "apks":[Ljava/io/File;
    if-eqz v1, :cond_2

    .line 683
    move-object v3, v1

    .local v3, "arr$":[Ljava/io/File;
    array-length v7, v3

    .local v7, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_1
    if-ge v5, v7, :cond_2

    aget-object v0, v3, v5

    .line 684
    .local v0, "apk":Ljava/io/File;
    invoke-static {v6, p1, v0}, Lcom/android/server/pm/PackageManagerServiceInjector;->shouldDeletePackage(Ljava/util/Set;Lcom/android/server/pm/Settings;Ljava/io/File;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 685
    const/4 v8, 0x5

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Try to delete invalid or duplicate package "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/android/server/pm/PackageManagerService;->reportSettingsProblem(ILjava/lang/String;)V

    .line 687
    invoke-static {v0}, Lcom/android/server/pm/PackageManagerServiceInjector;->deleteFileOrDirectory(Ljava/io/File;)V

    .line 683
    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 692
    .end local v0    # "apk":Ljava/io/File;
    .end local v1    # "apks":[Ljava/io/File;
    .end local v2    # "appDir":Ljava/io/File;
    .end local v3    # "arr$":[Ljava/io/File;
    .end local v5    # "i$":I
    .end local v6    # "keepedFilePaths":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v7    # "len$":I
    :cond_2
    return-void
.end method