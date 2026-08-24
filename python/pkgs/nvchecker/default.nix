{ lib
, awesomeversion
, buildPythonPackage
, cacert
, docutils
, dulwich
, fetchFromGitHub
, installShellFiles
, jq
, lxml
, packaging
, platformdirs
, pycurl
, pygit2
, pythonOlder
, setuptools
, structlog
, tornado
, zstandard
,
}:

buildPythonPackage (finalAttrs: {
  pname = "nvchecker";
  version = "2.21";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "lilydjwg";
    repo = "nvchecker";
    tag = "v${finalAttrs.version}";
    hash = "sha256-XQrroiuDM9ISmfQLUbYIAzBOSYtO6q1MXqMfC3X8BUI=";
  };

  build-system = [ setuptools ];

  nativeBuildInputs = [
    docutils
    installShellFiles
  ];

  dependencies = [
    structlog
    platformdirs
    tornado
    pycurl
  ];

  optional-dependencies = {
    # vercmp = [ pyalpm ];
    awesomeversion = [ awesomeversion ];
    pypi = [ packaging ];
    htmlparser = [ lxml ];
    rpmrepo = [ lxml ] ++ lib.optionals (pythonOlder "3.14") [ zstandard ];
    jq = [ jq ];
    git_pygit2 = [ pygit2 ];
    git_dulwich = [ dulwich ];
  };

  env = lib.optionalAttrs finalAttrs.doInstallCheck {
    SSL_CERT_FILE = "${cacert}/etc/ssl/certs/ca-bundle.crt";
  };

  postBuild = ''
    patchShebangs docs/myrst2man.py
    make -C docs man
  '';

  postInstall = ''
    installManPage docs/_build/man/nvchecker.1
  '';

  pythonImportsCheck = [ "nvchecker" ];

  disabledTestMarks = [ "needs_net" ];

  meta = {
    description = "New version checker for software";
    homepage = "https://github.com/lilydjwg/nvchecker";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
