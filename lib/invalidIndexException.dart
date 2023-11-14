class InvalidIndexException implements Exception{
    String message = "index inválido";

    @override
    String toString() {
        return 'InvalidIndexException: $this.message';
    }
}