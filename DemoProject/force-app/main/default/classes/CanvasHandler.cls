public class CanvasHandler implements Canvas.CanvasLifecycleHandler {

public Contact part { get; set; }
//public String sn { get; set; }
public String accid { get; set; }


public Set<Canvas.ContextTypeEnum> excludeContextTypes(){
    Set<Canvas.ContextTypeEnum> excluded = new Set<Canvas.ContextTypeEnum>();
    return excluded;
}

public void onRender(Canvas.RenderContext renderContext) {

    //Get the Application and Environment context from the RenderContext
    Canvas.ApplicationContext app = renderContext.getApplicationContext();
    Canvas.EnvironmentContext env = renderContext.getEnvironmentContext();
    URL url = new URL(app.getCanvasUrl());
    Map<String, Object> params = (Map<String, Object>) JSON.deserializeUntyped(env.getParametersAsJSON());
    system.debug('params======= '+params);
    string accid =String.valueOf((String)params.get('accid'));
    /*String queryParams='';
    if('Home'==String.valueOf(((String)params.get('viewPage')))){
        queryParams = 'RelayState=accid%253D'+accid+'%2526action%253Dclienthomenew';
    }
    app.setCanvasUrlPath('/app/sso/saml?'+queryParams);*/
    app.setCanvasUrlPath('/apex/CanvasLightningPage?accid='+accid );
    //app.setCanvasUrlPath(encodedUrl);
    System.debug('Controller finalURL: ' + app.getCanvasUrl() );
    System.debug('accid***: ' + accid);
    System.debug('params ***: ' + params ); 
  }
 }