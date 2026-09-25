{
  lib,
  attrs,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  httpx,
  pydantic,
  pydantic-settings,
  pyjwt,
  python-dateutil,
  rfc3339,
  tenacity,
  toml,
}:

buildPythonPackage rec {
  pname = "qcs-api-client";
  version = "0.27.8";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "rigetti";
    repo = "qcs-api-client-python";
    tag = "v${version}";
    hash = "sha256-9BRmfgRp/nyiqM6P/WjnaovsrZrZx6Pcg7sFJjdcWlo=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'requires = ["uv_build>=0.12.7,<0.13"]' 'requires = ["hatchling"]' \
      --replace-fail 'build-backend = "uv_build"' 'build-backend = "hatchling.build"'
  '';

  pythonRelaxDeps = [
    "attrs"
    "httpx"
    "pydantic"
    "tenacity"
  ];

  pythonRemoveDeps = [
    # Rust-based native extension not yet packaged in Nix
    "qcs-api-client-common"
  ];

  build-system = [ hatchling ];

  dependencies = [
    attrs
    httpx
    pydantic
    pydantic-settings
    pyjwt
    python-dateutil
    rfc3339
    tenacity
    toml
  ];

  doCheck = false;

  # qcs_api_client.client requires qcs-api-client-common (Rust native extension)
  # which is not yet packaged, so skip import check
  pythonImportsCheck = [ ];

  meta = {
    description = "Python library for accessing the Rigetti QCS API";
    homepage = "https://qcs-api-client-python.readthedocs.io/";
    license = lib.licenses.asl20;
  };
}
