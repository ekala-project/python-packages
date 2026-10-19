{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "dictdiffer";
  version = "0.9.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "inveniosoftware";
    repo = "dictdiffer";
    tag = "v${finalAttrs.version}";
    hash = "sha256-lQyPs3lQWtsvNPuvvwJUTDzrFaOX5uwGuRHe3yWUheU=";
  };

  build-system = [ setuptools ];

  nativeBuildInputs = [ setuptools-scm ];
  postPatch = ''
    substituteInPlace setup.py \
      --replace "'pytest-runner>=2.7'," ""
    substituteInPlace pytest.ini \
      --replace ' --isort --pydocstyle --pycodestyle --doctest-glob="*.rst" --doctest-modules --cov=dictdiffer --cov-report=term-missing' ""
  '';

  pythonImportsCheck = [ "dictdiffer" ];

  meta = {
    description = "Module to diff and patch dictionaries";
    homepage = "https://github.com/inveniosoftware/dictdiffer";
    license = lib.licenses.mit;
  };
})
