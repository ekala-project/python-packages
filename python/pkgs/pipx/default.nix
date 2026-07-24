{
  lib,
  argcomplete,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  hatch-vcs,
  installShellFiles,
  colorama,
  packaging,
  platformdirs,
  tomli,
  userpath,
  uv,
}:

buildPythonPackage (finalAttrs: {
  pname = "pipx";
  version = "1.14.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pypa";
    repo = "pipx";
    tag = finalAttrs.version;
    hash = "sha256-4qSCyaYHam9y04qTgEUvbo/XiY9WNqX2fKZJOAVE2EM=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  dependencies = [
    argcomplete
    colorama
    packaging
    platformdirs
    tomli
    userpath
  ]
  ++ finalAttrs.passthru.optional-dependencies.uv;

  optional-dependencies = {
    uv = [
      uv
    ];
  };

  nativeBuildInputs = [
    installShellFiles
    argcomplete
  ];
  postInstall = ''
    installShellCompletion --cmd pipx \
      --bash <(register-python-argcomplete pipx --shell bash) \
      --zsh <(register-python-argcomplete pipx --shell zsh) \
      --fish <(register-python-argcomplete pipx --shell fish)
  '';

  pythonImportsCheck = [ "pipx" ];

  __structuredAttrs = true;

  meta = {
    description = "Install and run Python applications in isolated environments";
    mainProgram = "pipx";
    homepage = "https://github.com/pypa/pipx";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
