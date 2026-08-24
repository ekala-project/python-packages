{ lib
, buildPythonPackage
, fetchFromGitHub
, packaging
, setuptools
,
}:

buildPythonPackage rec {
  pname = "packaging-legacy";
  version = "23.0.post0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "di";
    repo = "packaging_legacy";
    tag = version;
    hash = "sha256-2TnJjxasC8+c+qHY60e6Jyqhf1nQJfj/tmIA/LvUsT8=";
  };

  build-system = [ setuptools ];

  dependencies = [ packaging ];

  pythonImportsCheck = [ "packaging_legacy" ];

  meta = {
    description = "Module to support for legacy Python Packaging functionality";
    homepage = "https://github.com/di/packaging_legacy";
    license = lib.licenses.bsd2;
    maintainers = [ ];
  };
}
