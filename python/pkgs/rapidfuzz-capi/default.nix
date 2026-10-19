{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "rapidfuzz-capi";
  version = "1.0.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "maxbachmann";
    repo = "rapidfuzz_capi";
    tag = "v${finalAttrs.version}";
    hash = "sha256-0IvJl2JU/k1WbGPWRoucVGbVsEFNPHZT1ozEQAKQnPk=";
  };

  build-system = [ setuptools ];

  # upstream has no tests

  pythonImportsCheck = [ "rapidfuzz_capi" ];

  meta = {
    description = "C-API of RapidFuzz, which can be used to extend RapidFuzz from separate packages";
    homepage = "https://github.com/maxbachmann/rapidfuzz_capi";
    license = lib.licenses.mit;
  };
})
