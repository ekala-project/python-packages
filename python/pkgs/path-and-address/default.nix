{
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  version = "2.0.1";
  pyproject = true;
  pname = "path-and-address";

  src = fetchFromGitHub {
    owner = "joeyespo";
    repo = "path-and-address";
    tag = "v${finalAttrs.version}";
    sha256 = "0b0afpsaim06mv3lhbpm8fmawcraggc11jhzr6h72kdj1cqjk5h6";
  };

  build-system = [ setuptools ];

})
