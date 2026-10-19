{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  defusedxml,
}:

buildPythonPackage (finalAttrs: {
  pname = "untangle";
  version = "1.2.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "stchris";
    repo = "untangle";
    # 1.1.1 is not tagged on GitHub
    tag = finalAttrs.version;
    hash = "sha256-i7B37Rj46ZVlN8vaMq7FoqS9dOoC680AqASdGk6pBJU=";
  };

  build-system = [ setuptools ];

  dependencies = [ defusedxml ];

  unittestFlagsArray = [
    "-s"
    "tests"
  ];

  meta = {
    description = "Convert XML documents into Python objects";
    homepage = "https://github.com/stchris/untangle";
    license = lib.licenses.mit;
  };
})
