use axum::extract::Path;
use axum::routing::{get, post};
use axum::{Router, Server};

#[tokio::main]
async fn main() {

    let router: Router = Router::new()
            .route("/", get(|| async {}))
            .route(
                "/user/:id",
                get(|Path(id): Path<String>| async move { id }),
            );

    let router: Router = router.route("/user", post(|| async {}));

    Server::bind(&"0.0.0.0:3000".parse().unwrap())
        .serve(router.into_make_service())
        .await
        .unwrap();
}
