# frozen_string_literal: true

require "spec_helper"

describe(DragonflyThumbnailer) do
  let(:overrides) { {} }
  let(:config) do
    Bridgetown.configuration(Bridgetown::Utils.deep_merge_hashes({
      "full_rebuild" => true,
      "root_dir"     => root_dir,
      "source"       => source_dir,
      "destination"  => dest_dir,
    }, overrides))
  end
  let(:metadata_overrides) { {} }
  let(:metadata_defaults) do
    {
      "name" => "My Awesome Site",
      "author" => {
        "name" => "Ada Lovejoy",
      }
    }
  end
  let(:preface) do
    "---\nlayout: default\n---\n\n"
  end
  let(:site) { Bridgetown::Site.new(config) }
  let(:contents) { File.read(dest_dir("index.html")) }

  before(:each) do
    allow(Bridgetown).to receive(:environment).and_return "production"
    allow(Bridgetown).to receive(:configuration).and_return config
    metadata = metadata_defaults.merge(metadata_overrides).to_yaml.sub("---\n", "")
    File.write(source_dir("index.html"), code)
    File.write(source_dir("_data/site_metadata.yml"), metadata)
    site.process
    FileUtils.rm(source_dir("_data/site_metadata.yml"))
  end

  context "image is found" do
    context "thumb_path with parameters" do
      let(:code) do
        preface + "Image path: {{ 'images/rc-20-ef.jpg' | thumbnail:'20x20' }}"
      end

      it "outputs path with geometry" do
        expect(contents).to match "Image path: images/20x20/rc-20-ef.jpg"
      end
    end

    context "thumb_path without parameters" do
      let(:code) do
        preface + "Image path: {{ 'images/rc-20-ef.jpg' | thumbnail }}"
      end

      it "outputs the path with default geometry" do
        expect(contents).to match "Image path: images/100x100/rc-20-ef.jpg"
      end
    end
  end

  context 'image is not found' do
    let(:code) do
        preface + "Image path: {{ 'images/rc-20-ef-not-existing.jpg' | thumbnail:'20x20' }}"
      end

    it "outputs the original path" do
      expect(contents).to match "Image path: images/rc-20-ef-not-existing.jpg"
    end
  end
end
