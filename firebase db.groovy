/users (auth.uid)
    └─ /profile               (subcolección opcional)
/categories                  (catálogo de categorías)
    └─ {categoryId}
        • name               : string
/products                    (bienes o servicios)
    └─ {productId}
        • categoryId         : ref(/categories/{id})
        • name               : string
        • price          : number
        • quantity        : number
/orders                      (ventas / servicios)
    └─ {orderId}
        • clientId           : string
        • status             : string       // pending | cancelled | done
        • items              : map[]        // vista rápida (ver más abajo)
        └─ /items            (subcolección de detalle)
            └─ {orderItemId}
                • productId  : ref(/products/{id})
                • price  : number