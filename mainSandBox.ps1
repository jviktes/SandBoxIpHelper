function isEven {
    param($number)
    if (($number % 2) -eq 0) {
        return $true
    } else {
        return $false
    }
}