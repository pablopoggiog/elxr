defmodule BlockappWeb.Authentication.Pipeline do
    use Guardian.Plug.Pipeline,
      otp_app: :blockapp,
      error_handler: BlockappWeb.Authentication.ErrorHandler,
      module: BlockappWeb.Authentication
  
    plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}
    plug Guardian.Plug.LoadResource, allow_blank: true
  end