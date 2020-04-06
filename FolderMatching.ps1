cls

$sourceFolderPath = "D:\Siepe\Folder Matching\Source"
$archiveFolderPath = "D:\Siepe\Folder Matching\Archive"


$File = "D:\Siepe\Folder Matching\folderMatching.csv"
"SourceFolderName,ArchiveFolderName,IsMatching" |out-file $File

$null=""

foreach($subFolder in Get-ChildItem -Directory $sourceFolderPath -Force){

#This will output all the matching folders and non matching folders of Source 

    if((Get-ChildItem -Directory $archiveFolderPath -Force).Name.Contains($subFolder.Name)){
        "$subFolder, $subFolder, Yes" | Out-File $File -Append
    }
    else{
        "$subFolder,$null,No"| Out-File $File -Append
    }
}

foreach($ArchiveSubFolder in Get-ChildItem -Directory $archiveFolderPath -Force){
    if(!((Get-ChildItem -Directory $sourceFolderPath -Force).Name.Contains($ArchiveSubFolder.Name))){
        "$null,$ArchiveSubFolder,No" | out-file $File -Append
    }
}

