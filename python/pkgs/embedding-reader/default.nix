{
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  fsspec,
  lib,
  numpy,
  pandas,
  pyarrow,
  pytestCheckHook,
  tqdm,
}:

buildPythonPackage (finalAttrs: {
  pname = "embedding-reader";
  version = "1.8.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "rom1504";
    repo = "embedding-reader";
    tag = finalAttrs.version;
    hash = "sha256-D7yrvV6hDqzHaIMhCQ16DhY/8FEr3P4gcT5vV371whs=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [ "pyarrow" ];

  dependencies = [
    fsspec
    numpy
    pandas
    pyarrow
    tqdm
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "embedding_reader" ];

  meta = {
    description = "Efficiently read embedding in streaming from any filesystem";
    homepage = "https://github.com/rom1504/embedding-reader";
    license = lib.licenses.mit;
  };
})
