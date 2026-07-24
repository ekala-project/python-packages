{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  poetry-core,
}:

buildPythonPackage rec {
  pname = "pycountry";
  version = "26.2.16";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pycountry";
    repo = "pycountry";
    tag = version;
    hash = "sha256-VmPCQszEaDNsSnMfAo5xyDZySJcC4TiWZrmQMfebKKQ=";
  };

  postPatch = ''
    sed -i "/addopts/d" pyproject.toml
    sed -i "/pytest-cov/d" pyproject.toml
  '';

  build-system = [ poetry-core ];

  pythonImportsCheck = [ "pycountry" ];

  doCheck = false;

  meta = {
    description = "ISO country, subdivision, language, currency and script definitions and their translations";
    homepage = "https://github.com/pycountry/pycountry";
    license = lib.licenses.lgpl21Plus;
  };
}
