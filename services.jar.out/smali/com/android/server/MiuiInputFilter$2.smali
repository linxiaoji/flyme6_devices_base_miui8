.class Lcom/android/server/MiuiInputFilter$2;
.super Ljava/lang/Object;
.source "MiuiInputFilter.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/MiuiInputFilter;->showGestureDetectAlert()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/MiuiInputFilter;

.field final synthetic val$dlg:Lmiui/app/AlertDialog;


# direct methods
.method constructor <init>(Lcom/android/server/MiuiInputFilter;Lmiui/app/AlertDialog;)V
    .locals 0

    .prologue
    .line 467
    iput-object p1, p0, Lcom/android/server/MiuiInputFilter$2;->this$0:Lcom/android/server/MiuiInputFilter;

    iput-object p2, p0, Lcom/android/server/MiuiInputFilter$2;->val$dlg:Lmiui/app/AlertDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 470
    iget-object v0, p0, Lcom/android/server/MiuiInputFilter$2;->val$dlg:Lmiui/app/AlertDialog;

    invoke-virtual {v0}, Lmiui/app/AlertDialog;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 471
    iget-object v0, p0, Lcom/android/server/MiuiInputFilter$2;->this$0:Lcom/android/server/MiuiInputFilter;

    const/4 v1, 0x0

    # invokes: Lcom/android/server/MiuiInputFilter;->setIsShowThreeGestureAlert(Z)V
    invoke-static {v0, v1}, Lcom/android/server/MiuiInputFilter;->access$200(Lcom/android/server/MiuiInputFilter;Z)V

    .line 473
    :cond_0
    return-void
.end method