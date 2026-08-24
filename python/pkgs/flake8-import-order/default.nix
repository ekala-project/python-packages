{ lib
, buildPythonPackage
, fetchFromGitHub
, flake8
, pycodestyle
, pylama
, setuptools
,
}:

buildPythonPackage rec {
  pname = "flake8-import-order";
  version = "0.19.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "PyCQA";
    repo = "flake8-import-order";
    tag = version;
    hash = "sha256-mXw3+pQMr2Ut1prj9sCZc4jyErDOyWJgq6OBPU1nZxs=";
  };

  build-system = [ setuptools ];

  dependencies = [ pycodestyle ];

  pythonImportsCheck = [ "flake8_import_order" ];

  meta = {
    description = "Flake8 and pylama plugin that checks the ordering of import statements";
    homepage = "https://github.com/PyCQA/flake8-import-order";
    license = lib.licenses.lgpl3Only;
    maintainers = [ ];
  };
}
