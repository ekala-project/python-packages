{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  # dependencies
  click,
  prettytable,
  prompt-toolkit,
  pygments,
  requests,
  rich,
  urllib3,
}:

buildPythonPackage rec {
  pname = "softlayer";
  version = "6.2.9";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "softlayer";
    repo = "softlayer-python";
    tag = "v${version}";
    hash = "sha256-kGgCW9N2NZi8PHcfpN+8L2bg7v1edP8ZXYaoSt9545M=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [ "rich" ];

  dependencies = [
    click
    prettytable
    prompt-toolkit
    pygments
    requests
    rich
    urllib3
  ];

  pythonImportsCheck = [ "SoftLayer" ];

  meta = {
    description = "Python libraries that assist in calling the SoftLayer API";
    homepage = "https://github.com/softlayer/softlayer-python";
    license = lib.licenses.mit;
  };
}
