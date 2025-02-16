task default -depends A, B, C

task Hello {
    "Hello, World!"
}

task A {
    "TaskA"
}

task B -precondition { return $false } {
    "TaskB"
}

task C -precondition { return $true } {
    "TaskC"
}
