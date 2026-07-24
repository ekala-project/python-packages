{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,

  # tests
  numpy,
}:

buildPythonPackage (finalAttrs: {
  pname = "einops";
  version = "0.8.2";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "arogozhnikov";
    repo = "einops";
    tag = "v${finalAttrs.version}";
    hash = "sha256-d5Vbtkw/MChS2j2IC6j97wfVoKWZT9mU4OeXyEjm6ys=";
  };

  build-system = [ hatchling ];
  env.EINOPS_TEST_BACKENDS = "numpy";

  pythonImportsCheck = [ "einops" ];
  meta = {
    description = "Flexible and powerful tensor operations for readable and reliable code";
    homepage = "https://github.com/arogozhnikov/einops";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
