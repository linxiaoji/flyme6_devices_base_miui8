.class final Landroid/os/MiuiProcess$PriorityState;
.super Ljava/lang/Object;
.source "MiuiProcess.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/os/MiuiProcess;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "PriorityState"
.end annotation


# instance fields
.field private prevPriority:I

.field private regionCounter:I


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    const/4 v0, 0x0

    iput v0, p0, Landroid/os/MiuiProcess$PriorityState;->regionCounter:I

    .line 49
    const/high16 v0, -0x80000000

    iput v0, p0, Landroid/os/MiuiProcess$PriorityState;->prevPriority:I

    return-void
.end method

.method synthetic constructor <init>(Landroid/os/MiuiProcess$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/MiuiProcess$1;

    .prologue
    .line 42
    invoke-direct {p0}, Landroid/os/MiuiProcess$PriorityState;-><init>()V

    return-void
.end method

.method static synthetic access$100(Landroid/os/MiuiProcess$PriorityState;)I
    .locals 1
    .param p0, "x0"    # Landroid/os/MiuiProcess$PriorityState;

    .prologue
    .line 42
    iget v0, p0, Landroid/os/MiuiProcess$PriorityState;->regionCounter:I

    return v0
.end method

.method static synthetic access$108(Landroid/os/MiuiProcess$PriorityState;)I
    .locals 2
    .param p0, "x0"    # Landroid/os/MiuiProcess$PriorityState;

    .prologue
    .line 42
    iget v0, p0, Landroid/os/MiuiProcess$PriorityState;->regionCounter:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Landroid/os/MiuiProcess$PriorityState;->regionCounter:I

    return v0
.end method

.method static synthetic access$110(Landroid/os/MiuiProcess$PriorityState;)I
    .locals 2
    .param p0, "x0"    # Landroid/os/MiuiProcess$PriorityState;

    .prologue
    .line 42
    iget v0, p0, Landroid/os/MiuiProcess$PriorityState;->regionCounter:I

    add-int/lit8 v1, v0, -0x1

    iput v1, p0, Landroid/os/MiuiProcess$PriorityState;->regionCounter:I

    return v0
.end method

.method static synthetic access$200(Landroid/os/MiuiProcess$PriorityState;)I
    .locals 1
    .param p0, "x0"    # Landroid/os/MiuiProcess$PriorityState;

    .prologue
    .line 42
    iget v0, p0, Landroid/os/MiuiProcess$PriorityState;->prevPriority:I

    return v0
.end method

.method static synthetic access$202(Landroid/os/MiuiProcess$PriorityState;I)I
    .locals 0
    .param p0, "x0"    # Landroid/os/MiuiProcess$PriorityState;
    .param p1, "x1"    # I

    .prologue
    .line 42
    iput p1, p0, Landroid/os/MiuiProcess$PriorityState;->prevPriority:I

    return p1
.end method
