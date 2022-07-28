use std::collections::HashMap;

use clap::Parser;
use rocket::State;
// use reqwest::header::{HeaderMap, HeaderValue};


#[macro_use] extern crate rocket;

#[derive(Parser, Debug)]
#[clap(name="Kouba.xyz API")]
struct Args {
    #[clap(long, value_parser)]
    slack_channel: String,
    #[clap(long, value_parser)]
    slack_token: String,
}

async fn log_to_slack(text: &str, channel: String, token: String) -> () {
    let client = reqwest::Client::new();
    let bearer: String = format!("Bearer {}", token);

    let response = client
        .post("https://slack.com/api/chat.postMessage")
        .header("Authorization", bearer)
        .form(&HashMap::from([("channel", channel), ("text", text.to_string())]))
        .send()
        .await
        .expect("a successful request")
        .json::<serde_json::Value>()
        .await
        .expect("expected the body to be json");

    dbg!(response);
}

#[get("/")]
async fn index(arguments: &State<Args>) -> &'static str {
    let sc = arguments.slack_channel.clone();
    let st = arguments.slack_token.clone();

    log_to_slack("/ called", sc, st).await;
    "TODO: List of available methods..."
}

#[get("/hello/<name>/<age>")]
async fn hello(arguments: &State<Args>, name: &str, age: u8) -> String {
    let sc = arguments.slack_channel.clone();
    let st = arguments.slack_token.clone();

    log_to_slack(format!("/hello called with name {} and age {}", name, age).as_str(), sc, st).await;
    format!("Hello, {} year old named {}!", age, name)
}

#[launch]
fn rocket() -> _ {

    rocket::build()
        .manage(Args::parse())
        .mount("/", routes![index, hello])
}

