{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
  inform,
  nestedtext,
}:

buildPythonPackage (finalAttrs: {
  pname = "nestedtext";
  version = "3.8";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "KenKundert";
    repo = "nestedtext";
    tag = "v${finalAttrs.version}";
    hash = "sha256-eg5Q11dl9ikGpNYx2Sd47MBPC9S4W2M6PpehFpowzdk=";
  };

  build-system = [ flit-core ];

  dependencies = [ inform ];

  # enabled when building passthru.tests.
  pythonImportsCheck = [ "nestedtext" ];

  meta = {
    description = "Human friendly data format";
    homepage = "https://nestedtext.org";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
