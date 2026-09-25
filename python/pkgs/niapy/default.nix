{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  matplotlib,
  numpy,
  openpyxl,
  pandas,
  setuptools,
  pytestCheckHook,
  pytest-xdist,
}:

buildPythonPackage rec {
  pname = "niapy";
  version = "2.7.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "NiaOrg";
    repo = "NiaPy";
    tag = "v${version}";
    hash = "sha256-g3B/jknzMIYP8VJayPktnYwq2WVA2KaCRS/ZzVwc88Q=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'requires = ["uv_build>=0.9.17,<0.10.0"]' 'requires = ["setuptools"]' \
      --replace-fail 'build-backend = "uv_build"' 'build-backend = "setuptools.build_meta"'
  '';

  build-system = [ setuptools ];

  dependencies = [
    matplotlib
    numpy
    openpyxl
    pandas
  ];

  pythonRelaxDeps = [
    "numpy"
  ];

  nativeCheckInputs = [
    pytestCheckHook
    pytest-xdist
  ];

  pythonImportsCheck = [ "niapy" ];

  meta = {
    description = "Micro framework for building nature-inspired algorithms";
    homepage = "https://niapy.org/";
    license = lib.licenses.mit;
  };
}
