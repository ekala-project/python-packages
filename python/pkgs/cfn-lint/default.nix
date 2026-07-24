{
  lib,
  aws-sam-translator,
  buildPythonPackage,
  defusedxml,
  fetchFromGitHub,
  jschema-to-python,
  jsonpatch,
  junit-xml,
  mock,
  networkx,
  pydot,
  pyyaml,
  regex,
  sarif-om,
  setuptools,
  sympy,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "cfn-lint";
  version = "1.43.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "aws-cloudformation";
    repo = "cfn-lint";
    tag = "v${version}";
    hash = "sha256-tolQ7O6J/pfmtw29t8SGBDEDGiTOsJdc/mI3ulUseKo=";
  };

  build-system = [ setuptools ];

  dependencies = [
    aws-sam-translator
    jsonpatch
    networkx
    pyyaml
    regex
    sympy
    typing-extensions
  ];

  optional-dependencies = {
    graph = [ pydot ];
    junit = [ junit-xml ];
    sarif = [
      jschema-to-python
      sarif-om
    ];
    full = lib.concatAttrValues (lib.removeAttrs optional-dependencies [ "full" ]);
  };
  pythonImportsCheck = [ "cfnlint" ];

  meta = {
    description = "Checks cloudformation for practices and behaviour that could potentially be improved";
    mainProgram = "cfn-lint";
    homepage = "https://github.com/aws-cloudformation/cfn-lint";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
