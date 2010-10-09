module VideosHelper
  def show_video(video)
    case video.player
    when 'flowplayer'
     flowplay =<<FLOW
     <a  id="player"
        href="#{video.url}"  
        style="width:640px;height:480px;"  
     > 
       <img style="width:640px;height:480px;"  src="/images/TheSecret.jpg"/>
     </a>
FLOW
     raw flowplay
    when 'html5'
      raw "<video id=\"theVideo\" controls=\"controls\" height=\"480\" src=\"#{video.url}\" width=\"640\" > </video>"
    end
  end

def  url_to_location(url)
      part=url.split("/")
      host = part[2]
      if host == "s3.amazonaws.com" 
        location = "amazon_s3_redirect"
        bucket = part[3]
        file = part[4]
      else
        location = "url_redirect"
        bucket = ""
        file = part[3..-1].join("/")
      end
      return location,host,bucket,file 
end

end

