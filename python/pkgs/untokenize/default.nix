{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "untokenize";
  version = "0.1.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-OGXbu7jvtLteqnLxvn8+C+AOqLfxJcacvR9f2pJvN6I=";
  };

  postPatch = ''
    # ast.Constant.s was removed in Python 3.14
    substituteInPlace setup.py \
      --replace-fail "body[0].value.s" "body[0].value.value"
  '';

  build-system = [ setuptools ];

  pythonImportsCheck = [ "untokenize" ];

  meta = {
    description = "Transforms tokens into original source code while preserving whitespace";
    homepage = "https://github.com/myint/untokenize";
    license = lib.licenses.mit;
  };
})
