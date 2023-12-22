
rm -rf release_gather_dir
mkdir release_gather_dir

cp ./bin/libs/linux/* ./release_gather_dir/
cp ./third_party/cairo/libs/arm64-linux/*.so.0 ./release_gather_dir/
cp ./third_party/cairo/libs/arm64-linux/*.so.1 ./release_gather_dir/
cp ./third_party/cairo/libs/arm64-linux/*.so.2 ./release_gather_dir/

cp ./third_party/lame/lib/arm64-linux/*.so.0 ./release_gather_dir/
cp ./third_party/mp4v2/lib/arm64-linux/*.so.2 ./release_gather_dir/
cp ./vendors/audio/lib/arm64-linux/*.so ./release_gather_dir/
cp ./vendors/umpl/lib/arm64-linux/*.so* ./release_gather_dir/