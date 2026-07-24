{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  aioquic,
  h11,
  h2,
  httpx,
  priority,
  trio,
  uvloop,
  wsproto,
  pdm-backend,
  pytest-asyncio,
  pytest-trio,
}:

buildPythonPackage rec {
  pname = "hypercorn";
  version = "0.18.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pgjones";
    repo = "Hypercorn";
    tag = version;
    hash = "sha256-RNurpDq5Z3N9Wv9Hq/l6A3yKUriCCKx9BrbrWGwBsUk=";
  };

  postPatch = ''
    sed -i "/^addopts/d" pyproject.toml
  '';

  build-system = [ pdm-backend ];

  dependencies = [
    h11
    h2
    priority
    wsproto
  ];

  optional-dependencies = {
    h3 = [ aioquic ];
    trio = [ trio ];
    uvloop = [ uvloop ];
  };
  meta = {
    homepage = "https://github.com/pgjones/hypercorn";
    description = "ASGI web server inspired by Gunicorn";
    mainProgram = "hypercorn";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
