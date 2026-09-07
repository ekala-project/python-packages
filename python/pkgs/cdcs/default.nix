{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  ipython,
  numpy,
  pandas,
  pytestCheckHook,
  requests,
  responses,
  setuptools,
  tqdm,
}:

buildPythonPackage rec {
  pname = "cdcs";
  version = "0.2.7";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "usnistgov";
    repo = "pycdcs";
    tag = "v${version}";
    hash = "sha256-UpPoTdcDDCmombeScFgjsFX+//Yfnn+ClDwYsZh0dxI=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'requires = ["uv_build>=0.11.26,<0.12"]' 'requires = ["setuptools"]' \
      --replace-fail 'build-backend = "uv_build"' 'build-backend = "setuptools.build_meta"'
  '';

  build-system = [ setuptools ];

  dependencies = [
    ipython
    numpy
    pandas
    requests
    tqdm
  ];

  nativeCheckInputs = [
    pytestCheckHook
    responses
  ];

  pythonImportsCheck = [ "cdcs" ];

  meta = {
    description = "Python client for performing REST calls to configurable data curation system (CDCS) databases";
    homepage = "https://github.com/usnistgov/pycdcs";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
