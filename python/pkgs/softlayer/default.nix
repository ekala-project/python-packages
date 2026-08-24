{ lib
, buildPythonPackage
, fetchFromGitHub
, # build-system
  setuptools
, # dependencies
  click
, prettytable
, prompt-toolkit
, pygments
, requests
, rich
, urllib3
,
}:

buildPythonPackage rec {
  pname = "softlayer";
  version = "6.2.7";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "softlayer";
    repo = "softlayer-python";
    tag = "v${version}";
    hash = "sha256-mlC4o39Ol1ALguc9KGpxB0M0vhWz4LG2uwhW8CBrVgg=";
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
    maintainers = [ ];
  };
}
