module VideosHelper
  def show_video(video)

# <%= f.select :player, [:html5, :flowplayer,:jw_player,:youtube,:vimeo] %> 
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
      raw "<video controls=\"controls\" height=\"480\" src=\"#{video.url}\" width=\"640\" />"
    end
  end
end

       #<img src="/images/rails.png">
        #style="display:block;width:640;height:480;"  
