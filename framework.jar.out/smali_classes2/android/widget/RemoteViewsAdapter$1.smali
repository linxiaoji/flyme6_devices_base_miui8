.class Landroid/widget/RemoteViewsAdapter$1;
.super Ljava/lang/Object;
.source "RemoteViewsAdapter.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/widget/RemoteViewsAdapter;->saveRemoteViewsCache()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/widget/RemoteViewsAdapter;

.field final synthetic val$key:Landroid/widget/RemoteViewsAdapter$RemoteViewsCacheKey;


# direct methods
.method constructor <init>(Landroid/widget/RemoteViewsAdapter;Landroid/widget/RemoteViewsAdapter$RemoteViewsCacheKey;)V
    .locals 0

    .prologue
    .line 919
    iput-object p1, p0, Landroid/widget/RemoteViewsAdapter$1;->this$0:Landroid/widget/RemoteViewsAdapter;

    iput-object p2, p0, Landroid/widget/RemoteViewsAdapter$1;->val$key:Landroid/widget/RemoteViewsAdapter$RemoteViewsCacheKey;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 922
    # getter for: Landroid/widget/RemoteViewsAdapter;->sCachedRemoteViewsCaches:Ljava/util/HashMap;
    invoke-static {}, Landroid/widget/RemoteViewsAdapter;->access$1400()Ljava/util/HashMap;

    move-result-object v1

    monitor-enter v1

    .line 923
    :try_start_0
    # getter for: Landroid/widget/RemoteViewsAdapter;->sCachedRemoteViewsCaches:Ljava/util/HashMap;
    invoke-static {}, Landroid/widget/RemoteViewsAdapter;->access$1400()Ljava/util/HashMap;

    move-result-object v0

    iget-object v2, p0, Landroid/widget/RemoteViewsAdapter$1;->val$key:Landroid/widget/RemoteViewsAdapter$RemoteViewsCacheKey;

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 924
    # getter for: Landroid/widget/RemoteViewsAdapter;->sCachedRemoteViewsCaches:Ljava/util/HashMap;
    invoke-static {}, Landroid/widget/RemoteViewsAdapter;->access$1400()Ljava/util/HashMap;

    move-result-object v0

    iget-object v2, p0, Landroid/widget/RemoteViewsAdapter$1;->val$key:Landroid/widget/RemoteViewsAdapter$RemoteViewsCacheKey;

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 926
    :cond_0
    # getter for: Landroid/widget/RemoteViewsAdapter;->sRemoteViewsCacheRemoveRunnables:Ljava/util/HashMap;
    invoke-static {}, Landroid/widget/RemoteViewsAdapter;->access$1500()Ljava/util/HashMap;

    move-result-object v0

    iget-object v2, p0, Landroid/widget/RemoteViewsAdapter$1;->val$key:Landroid/widget/RemoteViewsAdapter$RemoteViewsCacheKey;

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 927
    # getter for: Landroid/widget/RemoteViewsAdapter;->sRemoteViewsCacheRemoveRunnables:Ljava/util/HashMap;
    invoke-static {}, Landroid/widget/RemoteViewsAdapter;->access$1500()Ljava/util/HashMap;

    move-result-object v0

    iget-object v2, p0, Landroid/widget/RemoteViewsAdapter$1;->val$key:Landroid/widget/RemoteViewsAdapter$RemoteViewsCacheKey;

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 929
    :cond_1
    monitor-exit v1

    .line 930
    return-void

    .line 929
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method