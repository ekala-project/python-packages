{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  defusedxml,
  setuptools,
}:

buildPythonPackage rec {
  pname = "python-didl-lite";
  version = "1.5.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "StevenLooman";
    repo = "python-didl-lite";
    tag = version;
    hash = "sha256-kzE3k1GXn+6dZTiywr4YYBrjmWY13ZQSRWL4N882+7U=";
  };

  build-system = [ setuptools ];

  dependencies = [ defusedxml ];

  pythonImportsCheck = [ "didl_lite" ];

  meta = {
    description = "DIDL-Lite (Digital Item Declaration Language) tools for Python";
    homepage = "https://github.com/StevenLooman/python-didl-lite";
    license = lib.licenses.asl20;
  };
}
