.class Landroid/widget/Editor$SelectionHandleView$1;
.super Ljava/lang/Object;
.source "Editor.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/widget/Editor$SelectionHandleView;->fadeIn(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroid/widget/Editor$SelectionHandleView;

.field final synthetic val$locationY:I


# direct methods
.method constructor <init>(Landroid/widget/Editor$SelectionHandleView;I)V
    .locals 0

    .prologue
    .line 5107
    iput-object p1, p0, Landroid/widget/Editor$SelectionHandleView$1;->this$1:Landroid/widget/Editor$SelectionHandleView;

    iput p2, p0, Landroid/widget/Editor$SelectionHandleView$1;->val$locationY:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 5
    .param p1, "animation"    # Landroid/animation/ValueAnimator;

    .prologue
    const/4 v4, -0x1

    .line 5110
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v0

    .line 5111
    .local v0, "animatedValue":F
    iget-object v1, p0, Landroid/widget/Editor$SelectionHandleView$1;->this$1:Landroid/widget/Editor$SelectionHandleView;

    # getter for: Landroid/widget/Editor$SelectionHandleView;->mY:I
    invoke-static {v1}, Landroid/widget/Editor$SelectionHandleView;->access$3900(Landroid/widget/Editor$SelectionHandleView;)I

    move-result v1

    if-ne v1, v4, :cond_0

    .line 5112
    iget-object v1, p0, Landroid/widget/Editor$SelectionHandleView$1;->this$1:Landroid/widget/Editor$SelectionHandleView;

    iget v2, p0, Landroid/widget/Editor$SelectionHandleView$1;->val$locationY:I

    # setter for: Landroid/widget/Editor$SelectionHandleView;->mY:I
    invoke-static {v1, v2}, Landroid/widget/Editor$SelectionHandleView;->access$3902(Landroid/widget/Editor$SelectionHandleView;I)I

    .line 5114
    :cond_0
    iget-object v1, p0, Landroid/widget/Editor$SelectionHandleView$1;->this$1:Landroid/widget/Editor$SelectionHandleView;

    iget-object v1, v1, Landroid/widget/Editor$SelectionHandleView;->mContainer:Landroid/widget/Editor$AnimatePopupWindow;

    float-to-int v2, v0

    iget-object v3, p0, Landroid/widget/Editor$SelectionHandleView$1;->this$1:Landroid/widget/Editor$SelectionHandleView;

    # getter for: Landroid/widget/Editor$SelectionHandleView;->mY:I
    invoke-static {v3}, Landroid/widget/Editor$SelectionHandleView;->access$3900(Landroid/widget/Editor$SelectionHandleView;)I

    move-result v3

    invoke-virtual {v1, v2, v3, v4, v4}, Landroid/widget/Editor$AnimatePopupWindow;->update(IIII)V

    .line 5115
    return-void
.end method
