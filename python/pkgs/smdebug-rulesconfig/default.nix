{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "smdebug-rulesconfig";
  version = "1.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit version;
    pname = "smdebug_rulesconfig";
    sha256 = "1mpwjfvpmryqqwlbyf500584jclgm3vnxa740yyfzkvb5vmyc6bs";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "smdebug_rulesconfig" ];

  meta = {
    description = "These builtin rules are available in Amazon SageMaker";
    homepage = "https://github.com/awslabs/sagemaker-debugger-rulesconfig";
    license = lib.licenses.asl20;
  };
}
