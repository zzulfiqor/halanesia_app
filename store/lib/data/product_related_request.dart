class ProductRelatedRequest {
    ProductRelatedRequest({
        this.categoryId,
        this.page,
        this.size,
        this.merchantId,
    });

    int? categoryId;
    int? page;
    int? size;
    int? merchantId;
}