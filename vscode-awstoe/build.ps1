param(
	[ArgumentCompletions(
		'amazonlinux:2',
		'public.ecr.aws/amazonlinux/amazonlinux:2'
	)]
	[string]
	$BaseImage = 'public.ecr.aws/amazonlinux/amazonlinux:2'
)

$params = @(
	'--tag', 'al2-vscode-awstoe:latest'
	'--build-arg', "BASE_IMAGE=$BaseImage"
)
docker build @params $PSScriptRoot
