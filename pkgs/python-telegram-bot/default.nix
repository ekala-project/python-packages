{
  lib,
  aiolimiter,
  apscheduler,
  buildPythonPackage,
  cachetools,
  cffi,
  cryptography,
  fetchFromGitHub,
  hatchling,
  httpx,
  pythonAtLeast,
  pytz,
  setuptools,
  tornado,
}:

buildPythonPackage rec {
  pname = "python-telegram-bot";
  version = "22.7";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python-telegram-bot";
    repo = "python-telegram-bot";
    tag = "v${version}";
    hash = "sha256-+mbVN1XFChUMYReHMjQd1tx5gYpP1CWGNtuZCoY9TMo=";
  };

  build-system = [
    setuptools
    hatchling
  ];

  dependencies = [ httpx ];

  optional-dependencies = rec {
    all = ext ++ http2 ++ passport ++ socks;
    callback-data = [ cachetools ];
    ext = callback-data ++ job-queue ++ rate-limiter ++ webhooks;
    http2 = httpx.optional-dependencies.http2;
    job-queue = [
      apscheduler
      pytz
    ];
    passport = [ cryptography ] ++ lib.optionals (pythonAtLeast "3.13") [ cffi ];
    rate-limiter = [ aiolimiter ];
    socks = httpx.optional-dependencies.socks;
    webhooks = [ tornado ];
  };

  pythonImportsCheck = [ "telegram" ];

  meta = {
    description = "Python library to interface with the Telegram Bot API";
    homepage = "https://python-telegram-bot.org";
    license = lib.licenses.lgpl3Only;
  };
}
