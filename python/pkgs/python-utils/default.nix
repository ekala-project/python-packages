{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  loguru,
  pytest-asyncio,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "python-utils";
  version = "3.9.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "WoLpH";
    repo = "python-utils";
    tag = "v${version}";
    hash = "sha256-lzLzYI5jShfIwQqvfA8UtPjGawXE80ww7jb/gPzpeDo=";
  };

  postPatch = ''
    sed -i pytest.ini \
      -e '/--cov/d' \
      -e '/--mypy/d'
  '';

  build-system = [ setuptools ];

  dependencies = [ typing-extensions ];

  optional-dependencies = {
    loguru = [ loguru ];
  };
  pythonImportsCheck = [ "python_utils" ];
  meta = {
    description = "Module with some convenient utilities";
    homepage = "https://github.com/WoLpH/python-utils";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
